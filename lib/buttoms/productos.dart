import 'package:flutter/material.dart';

class Productos extends StatelessWidget {
  const Productos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Fondo del dropdown
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
        border: Border.all(
          color: Colors.white, // Borde del contenedor
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: 'Sphinx', // Valor por defecto
          icon: const Icon(
            Icons.arrow_drop_down_circle, // Icono personalizado
            color: Colors.white,
          ),
          iconSize: 28, // Tamaño del icono
          elevation: 16,
          dropdownColor: Colors.grey[800], // Fondo del dropdown al abrir
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600, // Texto en negrita
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              switch (newValue) {
                case 'Sphinx':
                  Navigator.of(context).pushNamed('Sphinx');
                  break;
                case 'Admin':
                  Navigator.of(context).pushNamed('Admin');
                  break;
              }
            }
          },
          items: <String>['Sphinx', 'Admin'] // Lista de valores
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white, // Color del texto
                  fontSize: 18,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
