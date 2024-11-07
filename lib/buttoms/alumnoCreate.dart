import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';

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

}