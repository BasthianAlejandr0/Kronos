//import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ButtomExcel extends StatefulWidget {
  const ButtomExcel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ButtomExcel createState() => _ButtomExcel();
}

class _ButtomExcel extends State<ButtomExcel> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;


Future<void> selectAndUploadFile(BuildContext context) async {
  try {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      showMessage(context, 'No se seleccionó ningún archivo.');
      return;
    }
    final pickedFile = result.files.first;
    // Obtener el nombre del archivo sin la extensión
    String fileName = pickedFile.name.split('.').first;
    // Convertir a JSON
    final jsonData = await excelToJson(pickedFile.bytes!);
    // Subir a Firestore usando el nombre del archivo como ID del documento
    await uploadJsonToFirestore(jsonData, fileName);
    // Mostrar éxito
    showMessage(context, 'Archivo subido correctamente a Firestore');

  } catch (e) {
    // Manejar errores
    showMessage(context, 'Error al subir el archivo: $e');
  }
}

  
  Future<Map<String, dynamic>> excelToJson(Uint8List fileBytes) async {
  var excel = Excel.decodeBytes(fileBytes);
  Map<String, dynamic> jsonData = {};

  for (var table in excel.tables.keys) {
    var sheet = excel.tables[table];

    if (sheet == null || sheet.rows.isEmpty) continue;

    // La primera fila se toma como los encabezados
    var headers = sheet.rows[0].map((cell) => cell?.value?.toString() ?? '').toList();

    // Procesamos todas las filas y concatenamos los valores de cada celda con coma
    for (var i = 1; i < sheet.rows.length; i++) {
      var row = sheet.rows[i];
      for (var j = 0; j < headers.length; j++) {
        // Si el valor en jsonData[headers[j]] ya existe, concatenamos el valor con una coma
        jsonData[headers[j]] = (jsonData[headers[j]] ?? '') + (jsonData[headers[j]]?.isEmpty ?? true ? '' : ', ') + (row[j]?.value?.toString() ?? '');
      }
    }
  }
  return jsonData;
}




Future<void> uploadJsonToFirestore(Map<String, dynamic> jsonData, String fileName) async {
  final firestore = FirebaseFirestore.instance;

  // Usamos el nombre del archivo como nombre del documento en Firestore
  await firestore.collection('instituciones').doc(fileName).set(jsonData);
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
        content: Text(message),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
              onPressed: () {
              // Acción para subir archivo Excel
              selectAndUploadFile(context);
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
        if (uploadTask != null) buildProgress(),
      ],
    );
  }


  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
          stream: uploadTask?.snapshotEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              double progress = data.bytesTransferred / data.totalBytes;
              return SizedBox(
                height: 50,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: progress,
                      color: Colors.green,
                    ),
                    Center(
                      child: Text(
                        '${(progress * 100).toStringAsFixed(2)} %',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox(
                height: 50,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LinearProgressIndicator(
                      value: 0.0,
                      color: Colors.green,
                    )
                  ],
                ),
              );
            }
          },  
        );  

      
}
  




