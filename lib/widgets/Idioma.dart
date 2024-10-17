import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Idioma extends StatelessWidget {
  const Idioma({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        // Cambiar idioma según la opción seleccionada
        if (value == 'es') {
          context.setLocale(const Locale('es'));
        } else if (value == 'en') {
          context.setLocale(const Locale('en'));
        }
      },
      icon: const Icon(
        Icons.language,
        color: Colors.white,
        ), // Icono que representará el menú desplegable
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'en',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/reino-unido.png', // Icono para inglés
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              const Text("ENG", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'es',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/España.png', // Icono para español
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              const Text("ESP", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
