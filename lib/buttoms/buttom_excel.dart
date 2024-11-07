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
    // Convertir a JSON
    final jsonData = await excelToJson(pickedFile.bytes!);
    // Subir a Firestore
    await uploadJsonToFirestore(jsonData);
    // Mostrar éxito
    showMessage(context, 'Archivo subido correctamente a Firestore');

  } catch (e) {
    // Manejar errores
    showMessage(context, 'Error al subir el archivo: $e');
  }
}
/* Future<Map<String, dynamic>> excelToJson(Uint8List fileBytes) async {
  var excel = Excel.decodeBytes(fileBytes);
  Map<String, dynamic> jsonData = {};

  for (var table in excel.tables.keys) {
    var sheet = excel.tables[table];

    if (sheet == null || sheet.rows.isEmpty) continue;

    // La primera fila se toma como los encabezados
    var headers = sheet.rows[0].map((cell) => cell?.value?.toString() ?? '').toList();

    // Procesamos las filas siguientes
    for (var i = 1; i < sheet.rows.length; i++) {
      var row = sheet.rows[i];
      Map<String, dynamic> rowData = {};
      for (var j = 0; j < headers.length; j++) {
        if (j < row.length) {
          // Asignamos el valor de la columna si existe, o vacío si no.
          rowData[headers[j]] = row[j]?.value?.toString() ?? '';
        } else {
          // Si no hay valor en la celda, agregamos una cadena vacía
          rowData[headers[j]] = '';
        }
      }
      // Guardamos los datos de la fila en el JSON final
      jsonData['Fila_$i'] = rowData;
    }
  }
  return jsonData;
}

Future<void> uploadJsonToFirestore(Map<String, dynamic> jsonData) async {
  final firestore = FirebaseFirestore.instance;
  // Aquí puedes elegir en qué colección guardar los datos
  await firestore.collection('estudiantes').add(jsonData);
} */
  
  Future<Map<String, dynamic>> excelToJson(Uint8List fileBytes) async {
  var excel = Excel.decodeBytes(fileBytes);
  Map<String, dynamic> jsonData = {};
  List<Map<String, dynamic>> rowsList = [];

  for (var table in excel.tables.keys) {
    var sheet = excel.tables[table];

    if (sheet == null || sheet.rows.isEmpty) continue;

    // La primera fila se toma como los encabezados
    var headers = sheet.rows[0].map((cell) => cell?.value?.toString() ?? '').toList();

    // Procesamos las filas siguientes
    for (var i = 1; i < sheet.rows.length; i++) {
      var row = sheet.rows[i];
      Map<String, dynamic> rowData = {};
      for (var j = 0; j < headers.length; j++) {
        if (j < row.length) {
          // Asignamos el valor de la columna si existe, o vacío si no.
          rowData[headers[j]] = row[j]?.value?.toString() ?? '';
        } else {
          rowData[headers[j]] = '';
        }
      }
      rowsList.add(rowData);
    }
  }
  
  // Guardamos todas las filas en una lista dentro de `jsonData`
  jsonData['datos'] = rowsList;
  return jsonData;
}

Future<void> uploadJsonToFirestore(Map<String, dynamic> jsonData) async {
  final firestore = FirebaseFirestore.instance;
  // Agrega los datos como un nuevo documento en la colección 'estudiantes'
  await firestore.collection('estudiantes').add(jsonData);
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
  




