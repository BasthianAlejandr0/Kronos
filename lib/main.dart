import 'package:flutter/material.dart';


import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/homePage.dart';
import 'pages/SphinxPage.dart';
import 'pages/adminPage.dart';
import 'pages/profilePage.dart';
import 'pages/userRegister.dart';
import 'pages/AlumnoNoRegister.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:297855924061:android:8b6a2f1f1f7f8d1b',
      messagingSenderId: '297855924061',
      projectId: 'kronos-software',
      apiKey: 'AIzaSyD9Q-1J9Q9Q9Q9Q9Q9Q9Q9Q9Q9Q9Q9Q9Q9',
      databaseURL: 'https://kronos-software.firebaseio.com',
    ),
  );
  await EasyLocalization.ensureInitialized();
  runApp( 
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'), 
        Locale('es')
        ],
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Kronos Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'Home',
      routes: {
        'Home': (context) =>  HomePage(),
        'Admin': (context) =>  const Adminpage(),
        'Profile': (context) =>  const Profilepage(),
        'userRegister': (context) =>  const UserRegister(),
        'Sphinx': (context) =>   const AdminSphinx(),
        'NoRegistrado': (context) => Alumnonoregister()
      },
    );
  }
}
