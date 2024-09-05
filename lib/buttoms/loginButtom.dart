import 'package:flutter/material.dart';

class loginButtom extends StatelessWidget {
  const loginButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: (){} ,
      child: Text(
        "Log in",
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          
          ),
        )
    );
  }
}