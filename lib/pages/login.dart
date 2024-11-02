import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../providers/auth_register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  String? errorMessage = '';
  User? user;

  @override
  void initState() {
    super.initState();
    user = AuthRegister().currentUser;
  }

  // Controladores para los campos de texto
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // Método para iniciar sesión
  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      // Si el inicio de sesión es exitoso, redirige a la pantalla de inicio
      Navigator.popAndPushNamed(context, 'Home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        // Manejo de errores
        if (e.code == 'user-not-found') {
          errorMessage = 'No se encontró ningún usuario con ese correo.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'La contraseña es incorrecta.';
        } else {
          errorMessage = 'Ocurrió un error. Inténtalo de nuevo.';
        }
      });
      // Opcional: Mostrar un SnackBar con el mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage!)),
      );
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
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 75, 75),
                ),
              ),
              const SizedBox(height: 30),
              // Contenedor del formulario de inicio de sesión
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
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
                          onPressed: signInWithEmailAndPassword,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Mostrar mensaje de error, si existe
                      if (errorMessage != null && errorMessage!.isNotEmpty)
                        Text(
                          errorMessage!,
                          style: const TextStyle(color: Colors.red),
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
