import 'package:flutter/material.dart';

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
      onPressed: () {},
      child: const Text(
        'Home',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Times New Roman',
          ),
      ),
    );
  }
}