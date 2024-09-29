
import 'package:flutter/material.dart';

class institutionsButtomPage extends StatelessWidget {
  const institutionsButtomPage({
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
        'Institutions',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          fontSize: 17.0
          ),
      ),
    );
  }
}