import 'package:flutter/material.dart';
import '../buttoms/productos.dart';
import '../widgets/Idioma.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/KronosBlanco.png',
              fit: BoxFit.contain,
              height: 150,
            ),
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
      ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido Administrador',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 75, 75),
                ),
              ),
            ],
            ),
        ),
      );

  }
}



