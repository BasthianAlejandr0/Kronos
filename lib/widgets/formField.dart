import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DropDownInstitutions extends StatefulWidget {
  @override
  _DropDownInstitutionsState createState() => _DropDownInstitutionsState();
}

class _DropDownInstitutionsState extends State<DropDownInstitutions> {
  // Lista de opciones para el dropdown
  final List<String> items = ['Colegio', 'Universidad', 'Instituto', 'Otro'];
  String? _selectedItem;
  TextEditingController rutController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedItem = items[0]; // Valor inicial del dropdown
  }

  // Función para verificar si el RUT y la contraseña son válidos
  Future<void> verifyRutAndPassword() async {
    String rut = rutController.text.trim();
    String password = passwordController.text.trim();

    if (rut.isEmpty || password.isEmpty) {
      // Mostrar mensaje de error si los campos están vacíos
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Por favor ingresa un RUT y una contraseña."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    try {
      // Acceder a la subcolección 'alumnos_ruts' dentro de la colección 'alumnos'
      final firestore = FirebaseFirestore.instance;

      // Buscar documentos que coincidan con el RUT y la contraseña
      final snapshot = await firestore
          .collectionGroup('alumnos_ruts')
          .where('RUT', isEqualTo: rut)
          .where('password', isEqualTo: password)
          .get();

      if (snapshot.docs.isEmpty) {
        // Si no se encuentran coincidencias
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("RUT o contraseña incorrectos."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      } else {
        // Si se encuentra un RUT y contraseña válidos
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Acceso exitoso"),
            content: Text("Bienvenido al sistema."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Aquí puedes redirigir al usuario a otra pantalla
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print("Error al verificar RUT y contraseña: $e");
      // Mostrar mensaje de error en caso de que falle la consulta
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Hubo un problema al verificar los datos."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
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
          SizedBox(
            width: 300,
            child: TextField(
              controller: rutController,
              decoration: const InputDecoration(
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
          SizedBox(
            width: 300,
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
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