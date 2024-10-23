import 'package:flutter/material.dart';

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
        Navigator.pushNamed(context,'JoinUs');
      },
      child: const Text(
        'Join Us',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 17.0
          ),
      ),
    );
  }
}