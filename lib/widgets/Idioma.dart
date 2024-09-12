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
        padding: const EdgeInsets.all(8.0),
        // backgroundColor: Colors.blue, // Color de fondo si lo necesitas
      ),
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              animationDuration: const Duration(milliseconds: 100),
              splashFactory: InkRipple.splashFactory,
            ),
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
