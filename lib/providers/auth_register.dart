//Registro de usuario
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRegister with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  //Con el metodo stream no spermite ver a actualizacion en tiempo real de la autenticacion
  Stream <User?> get authChange => _auth.authStateChanges();

  //Método para registrar un usuario

  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async{
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}