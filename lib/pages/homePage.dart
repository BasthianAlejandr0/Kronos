/* import 'dart:ffi';
 */
import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/aboutusPageButtom.dart';
import 'package:kronos_software/buttoms/drawerNavigator.dart';
import 'package:kronos_software/buttoms/institutionsButtomPage.dart';
import 'package:kronos_software/buttoms/joinUsButtomPage.dart';
import 'package:kronos_software/buttoms/loginButtom.dart';
import 'package:kronos_software/buttoms/projetsButtomPage.dart';
import 'package:kronos_software/buttoms/homeButtomPAge.dart';
import 'package:kronos_software/widgets/Idioma.dart';
import 'package:kronos_software/widgets/ubicationsMaps.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../buttoms/signinButtom.dart';

class HomePage extends StatelessWidget {
    HomePage({super.key});

// Controladores para cada video
  final YoutubePlayerController _controller1 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..cueVideoById(videoId: "a9MulJJ1J5g");

  final YoutubePlayerController _controller2 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..cueVideoById(videoId: "5UktyVCfFUc");

  final YoutubePlayerController _controller3 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..cueVideoById(videoId: "BEpcN-eE8ms");

  final YoutubePlayerController _controller4 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..cueVideoById(videoId: "MYPVQccHhAQ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Color.fromARGB(255, 60, 60, 60),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/KronosBlanco.png',
              fit: BoxFit.contain,
              height: 150,
            ),
            const SizedBox(width: 50),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  homeButtomPage(),
                  proyectButtomPage(),
                  joinusButtomPage(),
                  institutionsButtomPage(),
                  aboususButtomPage(),
                  Idioma(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerNavigator(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Image.asset(
                      'assets/KronosLogo.png',
                      fit: BoxFit.contain,
                      height: 130,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        size: 50,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          loginButtom(),
                          SizedBox(height: 10),
                          siginButtom(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Meet our last device',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/SphinxSinFondo.png',
                    fit: BoxFit.contain,
                    height: 150,
                  ),
                  SizedBox(width: 20,),
                  const SizedBox(
                    height: 160,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 2,
                      width: 20, // Cambia el ancho del divisor
                    ),
                  ),
                  SizedBox(width: 20,),
                  const SizedBox(
                    width: 500.0,
                    child: Text(
                      "The innovative device that will revolutionize education. Solve riddles, unleash your imagination, improve your logical-critical thinking, improve your social skills, improve your grades and much more. Sphinx is a device aimed at educational institutions.",
                      textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // CAJAS DE VIDEOS
              LayoutBuilder(
                builder: (context, constraints) {
                  // Ajustar el ancho del video dependiendo del ancho disponible
                  double videoWidth = constraints.maxWidth > 900
                      ? 300
                      : constraints.maxWidth / 3 - 20; // Divide el espacio disponible entre los videos

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: 250,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 180, 176, 176),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2, // Propagación de la sombra
                                  blurRadius: 5, // Difuminado de la sombra
                                  offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                                ),
                              ],
                            ),
                          ),
                          // child: YoutubePlayerControllerProvider(
                          //   controller: _controller1,
                          //   child: YoutubePlayer(controller: _controller1),
                          // ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2, // Propagación de la sombra
                                blurRadius: 5, // Difuminado de la sombra
                                offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Functionality',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Technical functions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: 250,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 180, 176, 176),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2, // Propagación de la sombra
                                  blurRadius: 5, // Difuminado de la sombra
                                  offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                                ),
                              ],
                            ),
                          ),
                          // child: YoutubePlayerControllerProvider(
                          //   controller: _controller2,
                          //   child: YoutubePlayer(controller: _controller2),
                          // ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2, // Propagación de la sombra
                                blurRadius: 5, // Difuminado de la sombra
                                offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sphinx',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Device Introduction',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: 250,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 180, 176, 176),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2, // Propagación de la sombra
                                  blurRadius: 5, // Difuminado de la sombra
                                  offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                                ),
                              ],
                            ),
                          ),
                          // child: YoutubePlayerControllerProvider(
                          //   controller: _controller4,
                          //   child: YoutubePlayer(controller: _controller4),
                          // ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2, // Propagación de la sombra
                                blurRadius: 5, // Difuminado de la sombra
                                offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Apply',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'How to apply Sphinx in a classroom',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                        ),
                      ],
                    ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 80),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Ajustar el ancho del video dependiendo del ancho disponible
                  double videoWidth = MediaQuery.of(context).size.width * 0.4;
                  double videoHeight = MediaQuery.of(context).size.height * 0.4; // 80% del ancho de la pantalla
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: videoHeight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 180, 176, 176),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2, // Propagación de la sombra
                                  blurRadius: 5, // Difuminado de la sombra
                                  offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                                ),
                              ],
                            ),
                          ),
                          // child: YoutubePlayerControllerProvider(
                          //   controller: _controller3,
                          //   child: YoutubePlayer(controller: _controller3),
                          // ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2, // Propagación de la sombra
                                blurRadius: 5, // Difuminado de la sombra
                                offset: Offset(0, 3), // Desplazamiento en los ejes X e Y
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Video',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Video',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                        ),
                      ],
                    ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 80),
              // MAPA Y TEXTO "SINCE 202X THE YEAR"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Texto "Since 202X the year"
                      const Text(
                        "Since 202X the year",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        child: Column(
                          children: [
                            const Text(
                              textAlign: TextAlign.justify,
                              "We have been working on the development of innovative devices that will revolutionize the world. Sphinx is the first of many devices that we will launch.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10), // Espacio entre el texto y el botón
                            ElevatedButton(
                              onPressed: () async {
                                // Acción del botón
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,  // Color del texto
                                backgroundColor: Colors.white,  // Color del fondo del botón
                                shadowColor: Colors.grey, // Color de la sombra con opacidad
                                elevation: 8, // Altura de la sombra (cuanto mayor, más visible será la sombra)
                              ),
                              child: const Text(
                                "Statistics",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Barra espaciadora ajustada
                  const SizedBox(
                    height: 255,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 2,
                      width: 20, // Cambia el ancho del divisor
                    ),
                  ),
                  const SizedBox(width: 20), // Añade espacio después del divisor
                  // Mapa (o cualquier otro contenido)
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Where are we",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        height: 200,
                        child: UbicationMaps(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 500,
                    //height: 250,
                    child: Column(
                      children: [
                        const Text(
                              "Stay With Us",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              textAlign: TextAlign.justify,
                              "Register your institution with us cuote your shpinx devices, improve the quality of leveling your students and increase the ranking of your institution",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(onPressed: () async {
                              Navigator.pushNamed(context,'JoinUs');
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, // Color del texto
                              backgroundColor: Color.fromARGB(255, 39, 39, 39),  // Color del fondo del botón
                            ), 
                            child: const Text("Contact us",
                            style: TextStyle(
                              fontSize: 17.0
                            ),) 
                            )
                        ],
                    ),
                  ),
                ],
              ),
              // IconButtons y BottomAppBar
              SizedBox(height: 80.0),
               Padding(
                 padding: const EdgeInsets.only(top:1.0,bottom: 1.0),
                 child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Color.fromARGB(255, 60, 60, 60), // Color de fondo para depuración
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.email, color: Colors.white),
                            iconSize: 30.0,
                            onPressed: () {
                              // Acción para el botón de email
                            },
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.instagram, color: Colors.white),
                            iconSize: 30.0,
                            onPressed: () async {
                              const url = 'https://www.instagram.com/kronosinnovations/';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'No pudo ingresar a la página web';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    /* const SizedBox(height: 1) */
                    const BottomAppBar(
                      color: Color.fromARGB(255, 60, 60, 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          homeButtomPage(),
                          proyectButtomPage(),
                          joinusButtomPage(),
                          institutionsButtomPage(),
                          aboususButtomPage(),
                        ],
                      ),
                    ),
                  ],
                ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
