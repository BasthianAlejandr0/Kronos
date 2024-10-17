import 'package:flutter/material.dart';
import 'package:kronos_software/pages/homePage.dart';

class homeButtomPage extends StatelessWidget {
  const homeButtomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: LinearBorder()
      ),
      onPressed: () async {
        Navigator.pushNamed(context,'Home');
      },
      child: const Text(
        'Home',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 17.0
          ),
      ),
    );
  }
}