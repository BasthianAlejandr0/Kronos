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
              // Acción del botón
            },
            child: Row(
              mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del Row al contenido
              children: [
                const Text(
                  'ENG', 
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman', // Tamaño del texto
                    color: Colors.white, // Color del texto
                  ),
                ),
                const SizedBox(width: 8), // Espacio entre el texto y la imagen
                Image.asset(
                  'assets/reino-unido.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
