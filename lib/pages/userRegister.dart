import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../providers/auth_register.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}
//Este espacio sirve para c
class _UserRegisterState extends State<UserRegister> {
  
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';
  User? user;

  @override
  void initState(){
    super.initState();
    user= AuthRegister().currentUser;
  }
  //Controladores para los campos de texto
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerApellido = TextEditingController();
  final TextEditingController _controllerRut = TextEditingController();
  final TextEditingController _controllerInsti = TextEditingController();
  final TextEditingController _controllerDire = TextEditingController();

  
  final List<String> sexo = ['Hombre', 'Mujer', 'Poco'];
  String? sexoSeleccionado;
  
  bool _obscureText = true;

  //Método para registrar un usuario
  Future<void> createUser() async {
  try {
    UserCredential userCredential = await AuthRegister().registerUser(
      email: _controllerEmail.text, 
      password: _controllerPassword.text,
    );
    FirebaseFirestore.instance
    .collection('usuarios')
    .doc(userCredential.user!.uid)
    .set({
      'Email': _controllerEmail.text,
      'Contraseña': _controllerPassword.text,
      'Nombre': _controllerName.text,
      'Apellido': _controllerApellido.text,
      'RUT': _controllerRut.text,
      'Institución': _controllerInsti.text,
      'Sexo': sexoSeleccionado,
      'Dirección': _controllerDire.text
    });
    //print("Usuario registrado correctamente en Firestore y Authentication");
    Navigator.of(context).pushNamed('Home');
  } on FirebaseAuthException {
  // Manejar errores de autenticación
  print("Creación exitosa");
  } catch (e) {
    // Manejar otros errores
    print('Error al registrar usuario: $e');
  }
  }


  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Método para validar rut
   TextEditingValue _formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Permitimos solo números y la letra K/k
    final text = newValue.text.toUpperCase().replaceAll(RegExp(r'[^0-9K]'), '');

    // Aquí añadimos la lógica para formatear el texto como 11.111.111-1
    if (text.length <= 1) {
      return newValue.copyWith(text: text);
    } else if (text.length <= 9) {
      String rut = text.substring(0, text.length - 1);
      String verificador = text.substring(text.length - 1);
      rut = rut.replaceAll(RegExp(r'\D'), '');
      String formattedRut = _formatRut(rut) + '-' + verificador;
      return newValue.copyWith(
        text: formattedRut,
        selection: TextSelection.collapsed(offset: formattedRut.length),
      );
    } else {
      return oldValue;
    }
  }
  String _formatRut(String rut) {
    return rut.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambia este color según tu necesidad
        ),
        title: Center(
          child: Image.asset(
            'assets/KronosBlanco.png',
            fit: BoxFit.contain,
            height: 150,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          key: _formKey,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_outlined,
                size: 100,
                color: Color.fromARGB(255, 75, 75, 75),
              ),
              const Text(
                "Registro de Usuario",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 75, 75),
                ),
              ),
              const SizedBox(height: 30),
              // Contenedor del formulario de registro
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 75, 75, 75),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      //Campo de Nombre
                      TextField(
                        controller: _controllerName,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        /* validator: (controller) {
                          if (controller == null || controller.isEmpty) {
                            return 'Por favor ingrese su correo';
                          }
                          String pattern =
                            r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(controller)) {
                          return 'Ingrese un correo electrónico válido';
                        }
                        return null;
                        }, */
                      ),
                      
                      const SizedBox(height: 20),

                      //Campo de Apellido
                      TextField(
                        controller: _controllerApellido,
                        decoration: const InputDecoration(
                          labelText: 'Apellido',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        /* validator: (controller) {
                          if (controller == null || controller.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(controller)) {
                            return 'El nombre solo debe contener letras y espacios';
                          }
                          return null;
                        }, */
                      ),
                      const SizedBox(height: 20),

                      //Campo de Nombre
                      TextField(
                        controller: _controllerRut,
                        decoration: const InputDecoration(
                          labelText: 'Rut',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                          //TextInputFormatter.withFunction(_formatEditUpdate)
                        ],
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: _controllerInsti,
                        decoration: const InputDecoration(
                          labelText: 'Institución',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.school),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                      ),
                      const SizedBox(height: 20),

                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Sexo',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        value: sexoSeleccionado,
                        onChanged: (String? newValue) {
                          setState(() {
                            sexoSeleccionado = newValue;
                          });
                        },
                        items: sexo.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),

                      //Campo de dirección
                      TextField(
                        controller: _controllerDire,
                        decoration: const InputDecoration(
                          labelText: 'Dirección',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.pin),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        /* validator: (controller) {
                          if (controller == null || controller.isEmpty) {
                            return 'Por favor ingrese su nombre';
                          } else if (!RegExp(r'^[a-zA-Z0-9. ]+$').hasMatch(controller)) {
                            return 'El nombre solo debe contener letras, números, puntos y espacios';
                          }
                          return null;
                        }, */
                      ),
                      const SizedBox(height: 20),

                      // Campo de correo electrónico
                      TextField(
                        controller: _controllerEmail,
                        decoration: const InputDecoration(
                          labelText: 'Correo Electrónico',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),

                      // Campo de contraseña
                      TextField(
                        controller: _controllerPassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off, // Cambia el icono según el estado
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText; // Alterna la visibilidad
                              });
                            },
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                             await createUser();
                             _controllerEmail.clear();
                              _controllerPassword.clear();
                              _controllerName.clear();
                              _controllerApellido.clear();
                              _controllerRut.clear();
                              _controllerInsti.clear();
                              _controllerDire.clear();
                              sexoSeleccionado!;
                            showDialog(
                              context: context,
                              barrierDismissible: false, // Evitar que se cierre al hacer clic fuera
                              builder: (BuildContext context) {
                                // Cerrar el diálogo automáticamente después de 2 segundos
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.of(context).pop(true); // Cerrar el diálogo
                                });

                                return AlertDialog(
                                  title: Text('Usuario creado'),
                                  content: Text('El usuario ha sido creado exitosamente.'),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
