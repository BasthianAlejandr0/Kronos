import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../buttoms/alumnoCreate.dart';
import '../buttoms/buttom_excel.dart';
import '../buttoms/productos.dart';
import '../widgets/Idioma.dart';

class AdminSphinx extends StatefulWidget {
  const AdminSphinx({super.key});

  @override
  State<AdminSphinx> createState() => _AdminSphinx();
}Future<void> createUsersForAllAlumnos(BuildContext context) async {
    final alumnoCreate = AlumnoCreate();
    final firestore = FirebaseFirestore.instance;
    final Map<String, String> userCredentials = {};

    try {
      // Obtener todos los documentos de la colección 'alumnos'
      final querySnapshot = await firestore.collection('alumnos').get();

      for (var doc in querySnapshot.docs) {
        var alumnoData = doc.data();
        var rut = alumnoData['RUT'];
        var password = alumnoCreate.generateRandomPassword(8); // Generar una contraseña aleatoria de 8 caracteres

        // Agregar la contraseña al mapa de datos del alumno
        alumnoData['password'] = password;

        // Guardar los datos del alumno en Firestore usando el RUT como identificador
        await firestore.collection('alumnos').doc(rut).set(alumnoData);

        // Agregar las credenciales al mapa
        userCredentials[rut] = password;
      }

      // Convertir el mapa de credenciales a JSON
      String credentialsJson = jsonEncode(userCredentials);

      // Mostrar el JSON en un diálogo
      showMessage(context, 'Usuarios creados correctamente para todos los alumnos.\n\nCredenciales:\n$credentialsJson');
    } catch (e) {
      // Manejar errores
      showMessage(context, 'Error al crear usuarios: $e');
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
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        // Acción para crear usuario para cada alumno
                        await createUsersForAllAlumnos(context);
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Por Definir",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Contenido pendiente para esta sección",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
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
                                  // Acción para crear usuario para cada alumno
                                  await createUsersForAllAlumnos(context);
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
                    ],
                  ),
                )
              );
              }
}
