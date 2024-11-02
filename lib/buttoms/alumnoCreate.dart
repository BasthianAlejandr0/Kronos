import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlumnoCreate {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Generar una contraseña aleatoria
  String generateRandomPassword(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  // Crear un alumno en Firestore
  Future<void> createAlumno(Map<String, dynamic> alumnoData) async {
    var rut = alumnoData['RUT'];

    if (rut != null) {
      var password = generateRandomPassword(8); // Generar una contraseña aleatoria de 8 caracteres

      // Agregar la contraseña al mapa de datos del alumno
      alumnoData['password'] = password;

      // Guardar los datos del alumno en Firestore usando el RUT como identificador
      await firestore.collection('alumnos').doc(rut).set(alumnoData);
    }
  }
}