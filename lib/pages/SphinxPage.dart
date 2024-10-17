import 'package:flutter/material.dart';

import '../buttoms/buttom_excel.dart';
import '../buttoms/productos.dart';
import '../widgets/Idioma.dart';

class AdminSphinx extends StatefulWidget {
  const AdminSphinx({super.key});

  @override
  State<AdminSphinx> createState() => _AdminSphinx();
}

class _AdminSphinx extends State<AdminSphinx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  toolbarHeight: 100,
  backgroundColor: const Color.fromARGB(255, 75, 75, 75),
  title: Stack(
    alignment: Alignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/KronosBlanco.png',
            fit: BoxFit.contain,
            height: 150,
          ),
          // Espacio expandido entre la imagen y los elementos del lado derecho
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Productos(),
                const SizedBox(width: 20),
                const Idioma(),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Acción al presionar el icono de perfil
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      const Text(
        "Sphinx",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontStyle: FontStyle.italic
        ),
      ),
    ],
  ),
),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primera Columna
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Institución inscrita",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contenido para la Sección 1",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtomExcel(),
                ],
              ),
            ),
            // Divisor Vertical
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20,
            ),
            // Segunda Columna
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Datos Institucionales",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contenido para la Sección 2",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            // Divisor Vertical
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 20,
            ),
            // Tercera Columna
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Alumnos Inscritos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contenido para la Sección 3",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
