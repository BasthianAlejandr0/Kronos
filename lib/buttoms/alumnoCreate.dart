import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AlumnoCreate {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Generar una contraseña aleatoria
  String generateRandomPassword(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  /* // Crear un alumno en Firestore
  Future<void> createAlumno(Map<String, dynamic> alumnoData) async {
    var rut = alumnoData['RUT'];

    if (rut != null) {
      var password = generateRandomPassword(8); // Generar una contraseña aleatoria de 8 caracteres

      // Agregar la contraseña al mapa de datos del alumno
      alumnoData['password'] = password;

      // Guardar los datos del alumno en Firestore usando el RUT como identificador
      await firestore.collection('alumnos').doc(rut).set(alumnoData);
    }
  } */

 Future<void> getRutFromFirestore() async {
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
}


Future<void> getRutAndGeneratePassword() async {
  try {
    final firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final collectionRef = firestore.collection('instituciones');

    // Obtener los documentos en la colección
    final snapshot = await collectionRef.get();

    for (var doc in snapshot.docs) {
      if (doc.data().containsKey('RUT') && doc.data().containsKey('CORREO')) {
        String rut = doc['RUT'];
        String email = doc['CORREO'];
        String password = generateRandomPassword(8); // Genera una contraseña de 8 caracteres

        try {
          // Crear el usuario en Firebase Authentication
          UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Guardar el RUT, email y contraseña en la colección "alumnos"
          await firestore.collection('alumnos').doc(doc.id).set({
            'RUT': rut,
            'Email': email,
            'password': password,
          });

          print('Usuario creado y datos guardados para $email.');
        } catch (authError) {
          print('Error al crear el usuario en Authentication: $authError');
        }
      }
    }
    print('Proceso completado para todos los documentos.');
  } catch (e) {
    print('Error al obtener los datos o guardar en Firestore: $e');
  }
}

}