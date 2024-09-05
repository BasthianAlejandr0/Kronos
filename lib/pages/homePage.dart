

import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/aboutusPageButtom.dart';
import 'package:kronos_software/buttoms/institutionsButtomPage.dart';
import 'package:kronos_software/buttoms/joinUsButtomPage.dart';
import 'package:kronos_software/buttoms/loginButtom.dart';
import 'package:kronos_software/buttoms/projetsButtomPage.dart';
import 'package:kronos_software/buttoms/signinButtom.dart';
import 'package:kronos_software/buttoms/homeButtomPAge.dart';
import 'package:kronos_software/widgets/Idioma.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 75, 75, 75),
        title: Column(
          children:[
            Image.asset(
              'assets/KronosBlanco.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            ]
          ),
        actions: [
          //Botones de la barra de navegación
          homeButtomPage(),
          SizedBox(width: 30),
          proyectButtomPage(),
          SizedBox(width: 30),
          joinusButtomPage(),
          SizedBox(width: 30),
          institutionsButtomPage(),
          SizedBox(width: 30),
          aboususButtomPage(),
          SizedBox(width: 30),
          Idioma()

        ],
      ),
       body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //Ponemos un espacio entre los botones y la imagen
          children: [
            Expanded(
              child: Image.asset(
                'assets/KronosLogo.png',
                fit: BoxFit.contain,
                height: 100,
                ),
                  ),
            Column(
              mainAxisSize: MainAxisSize.min, //Lo ajustamos en mitad de la pantalla
              children: [
                Row(
                  children: [   
                    //Icon(Icons.account_circle, size: 80, color: Color.fromARGB(255, 75, 75, 75)),
                    Column(
                      children: [
                        siginButtom(),
                        SizedBox(height: 10),
                        loginButtom(),
                      ],
                    )
                  ],
                ),   
              ],        
            ),
          ],
        ),
      )
    );
  }
}





