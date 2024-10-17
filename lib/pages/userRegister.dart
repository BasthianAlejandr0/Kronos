import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../providers/auth_register.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}
//Este espacio sirve para c
class _UserRegisterState extends State<UserRegister> {
  
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
  final TextEditingController _controllerUsername = TextEditingController();

  //Método para registrar un usuario
  Future<void> createUserWithEmailAndPassword() async {
  try {
    UserCredential userCredential = await AuthRegister().registerUser(
      email: _controllerEmail.text, 
      password: _controllerPassword.text, 
    );
    FirebaseFirestore.instance
    .collection('usuarios')
    .doc(userCredential.user!.uid)
    .set({
      'email': _controllerEmail.text,
      'username': _controllerUsername.text,
    });
    Navigator.of(context).pushNamed('Home');
  } on FirebaseAuthException catch (e) {
    setState(() {
      errorMessage = e.message ?? 'Error desconocido';
    });
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
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
                      TextField(
                        controller: _controllerUsername,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      // Campo de contraseña
                      TextField(
                        controller: _controllerPassword,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción al presionar el botón de registro
                            createUserWithEmailAndPassword();
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
                              color: Colors.white
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
