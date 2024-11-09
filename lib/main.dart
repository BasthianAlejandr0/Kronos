import 'package:flutter/material.dart';


import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kronos_software/firebase_options.dart';

import 'pages/homePage.dart';
import 'pages/SphinxPage.dart';
import 'pages/adminPage.dart';
import 'pages/userRegister.dart';
import 'pages/AlumnoNoRegister.dart';
import 'pages/JoinToUs.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
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
        'Institutions': (context) =>  Alumnonoregister(),
        'userRegister': (context) =>  const UserRegister(),
        'Sphinx': (context) =>   const AdminSphinx(),
        'JoinUs': (context) =>  JoinToUs(),
      },
    );
  }
}
