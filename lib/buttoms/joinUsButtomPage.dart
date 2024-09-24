import 'package:flutter/material.dart';
import 'package:kronos_software/pages/AlumnoNoRegister.dart';

class joinusButtomPage extends StatelessWidget {
  const joinusButtomPage({
    super.key,
  });

  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: LinearBorder()
      ),
      onPressed: () async {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Alumnonoregister()));
      },
      child: const Text(
        'Join Us',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 15.5
          ),
      ),
    );
  }
}