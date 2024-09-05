
import 'package:flutter/material.dart';

class aboususButtomPage extends StatelessWidget {
  const aboususButtomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: LinearBorder()
      ),
      onPressed: () {},
      child: const Text(
        'About us',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          ),
      ),
    );
  }
}