import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ButtomExcel extends StatefulWidget {
  const ButtomExcel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ButtonExcel createState() => _ButtonExcel();
}

class _ButtonExcel extends State<ButtomExcel> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

//Seleccionar archivo
  Future selectFile() async{
    // ignore: unused_local_variable
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      return;
    }
    setState(() {
      pickedFile = result.files.first;
    });
  }

//Subir archivo
  Future uploadFile() async{
    final path= 'Files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref= FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });
    
    uploadTask= ref.putFile(file);

    final snapshot= await uploadTask!.whenComplete(() => null);

    final urlDownload= await snapshot.ref.getDownloadURL();

    if (urlDownload != null) {
      print('URL de descarga: $urlDownload');
      setState(() {
        uploadTask = null;
      });
    }
    else{
      print('Error al subir el archivo');
    }
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: selectFile,
            child: const Text("Seleccionar archivo Excel"),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: uploadFile,
          child: const Text("Cargar archivo Excel"),
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
  




