import 'package:flutter/material.dart';

class DropDownInstitutions extends StatefulWidget {
  @override
  _DropDownInstitutionsState createState() => _DropDownInstitutionsState();
}

class _DropDownInstitutionsState extends State<DropDownInstitutions> {
  // Lista de opciones para el dropdown
  final List<String> items = ['Colegio', 'Universidad', 'Instituto', 'Otro'];
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = items[0]; // Valor inicial del dropdown
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 88, 88, 88),
        
      ),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: DropdownButton<String>(
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                isExpanded: true,
                iconEnabledColor: const Color.fromARGB(255, 255, 255, 255),
                dropdownColor: const Color.fromARGB(255, 154, 154, 154),
                value: _selectedItem,
                // Función que se ejecuta cuando se selecciona un nuevo valor
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rut',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 177, 174, 174),
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}