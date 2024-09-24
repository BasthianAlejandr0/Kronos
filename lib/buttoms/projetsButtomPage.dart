

import 'package:flutter/material.dart';

class proyectButtomPage extends StatelessWidget {
  const proyectButtomPage({
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
        'Projects',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 15.5
          ),
      ),
    );
  }
}