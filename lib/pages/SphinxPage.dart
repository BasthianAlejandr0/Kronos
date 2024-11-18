import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../buttoms/alumnoCreate.dart';
import '../buttoms/buttom_excel.dart';
import '../buttoms/productos.dart';
import '../widgets/Idioma.dart';

class AdminSphinx extends StatefulWidget {
  const AdminSphinx({super.key});

  @override
  State<AdminSphinx> createState() => _AdminSphinx();
}

/* Future<void> getRutFromFirestore() async {
  try {
    // Referencia a la colección donde se guardaron los datos
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('instituciones');  // Asegúrate de que esta sea la colección correcta

    // Obtención de los documentos en la colección
    final snapshot = await collectionRef.get();

    // Lista para almacenar los valores de RUT
    List<String> rutList = [];

    // Iterar sobre los documentos y obtener el campo 'RUT'
    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('RUT')) {
        rutList.add(doc['RUT']);
      }
    }

    // Mostrar la lista de RUT en la consola
    print('RUTs encontrados: $rutList');
  } catch (e) {
    print('Error al obtener los datos de Firestore: $e');
  }
} */

String generateRandomPassword(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

Future<void> getRutAndGeneratePassword() async {
  try {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('instituciones');

    // Obtener todos los documentos de la colección 'instituciones'
    final snapshot = await collectionRef.get();

    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('RUT') && doc.data().containsKey('CORREO')) {
        // Obtener los RUTs como una cadena y dividirlos por coma
        String rutString = doc['RUT']; // Cadena de RUTs separados por coma
        List<String> ruts = rutString.split(','); // Dividir la cadena en una lista de RUTs

        // Crear una nueva colección para cada institución dentro de la colección 'alumnos'
        final institutionCollectionRef = firestore.collection('alumnos').doc(doc.id).collection('alumnos_ruts');

        for (var rut in ruts) {
          rut = rut.trim(); // Limpiar espacios adicionales

          String password = generateRandomPassword(8); // Generar una contraseña aleatoria de 8 caracteres

          // Crear el documento para cada RUT en la nueva colección 'alumnos_ruts'
          await institutionCollectionRef.doc(rut).set({
            'RUT': rut,
            'password': password,
          });

          print('Contraseña generada y guardada para RUT: $rut');
        }
      }
    }

    print('Proceso completado para todos los documentos.');
  } catch (e) {
    print('Error al obtener los datos o guardar en Firestore: $e');
  }
}

Future<void> fetchRutsAndPasswords() async {
  try {
    final firestore = FirebaseFirestore.instance;
    
    // Acceder a la subcolección 'alumnos_ruts' directamente desde la colección 'alumnos'
    final rutsSnapshot = await firestore.collectionGroup('alumnos_ruts').get();

    // Verificar si se encontraron documentos
    if (rutsSnapshot.docs.isEmpty) {
      print('No hay documentos en la subcolección "alumnos_ruts".');
    } else {
      print('Documentos encontrados en la subcolección "alumnos_ruts": ${rutsSnapshot.docs.length}');
    }

    // Iterar sobre los documentos de la subcolección 'alumnos_ruts'
    for (var rutDoc in rutsSnapshot.docs) {
      String rut = rutDoc['RUT'];
      String password = rutDoc['password'];

      // Imprimir RUT y contraseña en la consola
      print('RUT: $rut, Contraseña: $password');
    }

    print('Proceso completado para todos los RUTs y contraseñas.');
  } catch (e) {
    print('Error al obtener los datos de los RUTs y contraseñas: $e');
  }
}

  void showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Iniciar el temporizador para cerrar el diálogo después de 2 segundos
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Cerrar el diálogo automáticamente
        });

        return AlertDialog(
          content: SingleChildScrollView(
            child: Text(message),
          ),
        );
      },
    );
  }


class _AdminSphinx extends State<AdminSphinx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/KronosBlanco.png',
                  fit: BoxFit.contain,
                  height: 150,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Productos(),
                      SizedBox(width: 20),
                      Idioma(),
                      SizedBox(width: 20),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              "Sphinx",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primera Columna
           Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Añadir Institución por Alumnos",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Subir archivo Excel para registrar alumnos",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ButtomExcel(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // Acción para crear usuario para cada alumno
                        //await createUsersForAllAlumnos(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Crear Usuarios para Alumnos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Divisor Vertical
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20,
            ),
            // Segunda Columna
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Añadir Institución por Alumnos",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Subir archivo Excel para registrar alumnos",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para subir archivo Excel
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Subir Excel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            // Divisor Vertical
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20,
            ),
            // Tercera Columna
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Por Definir",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              getRutAndGeneratePassword();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Crear Usuarios para Alumnos",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          /* ElevatedButton(
                            onPressed: () {
                              fetchRutsAndPasswords();
                            }, 
                            child: Text("Creamiento")) */
                        ],
                      ),
                    ),
                  ),
                    ],
                  ),
                )
              );
              }
}
