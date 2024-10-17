import 'package:flutter/material.dart';

class Productos extends StatelessWidget {
  const Productos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
          value: 'Sphinx',
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          dropdownColor: Colors.black,
          onChanged: (String? newValue) {
            if (newValue == 'Sphinx') {
              Navigator.of(context).pushNamed('Sphinx');
            }
          },
          items: <String>['Sphinx']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
    );
  }
}