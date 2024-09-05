import 'package:flutter/material.dart';

class Idioma extends StatelessWidget {
  const Idioma({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Acción al presionar el botón
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(8.0),
        // backgroundColor: Colors.blue, // Color de fondo si lo necesitas
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () {           
            }, 
            child: Image.asset(
            'assets/reino-unido.png',
            width: 24,
            height: 24,
            
          ),)
        ],
      ),
    );
  }
}
