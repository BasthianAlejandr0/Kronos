/* import 'dart:ffi';
 */
import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/aboutusPageButtom.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 60, 60, 60),
              ),
              child: Image.asset(
                "assets/KronosLogo.png",
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Imagen centrada
              Stack(
                children: [
                  //Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                    child:
                    Image.asset(
                    'assets/KronosLogo.png',
                    fit: BoxFit.contain,
                    height: 150,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                              Icons.person,
                              size: 50,
                            ),
                        SizedBox(width: 10),
                        loginButtom(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
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
                  SizedBox(
                    height: 160,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 2,
                      width: 20, // Cambia el ancho del divisor
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
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
                          child: YoutubePlayerControllerProvider(
                            controller: _controller1,
                            child: YoutubePlayer(controller: _controller1),
                          ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5) ,bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                ),
                                ]
                          ),
                          padding: const EdgeInsets.all(8.0),
                          //color: , // Cambia el color de fondo del recuadro si lo deseas
                          child: const Text(
                            'Functionality',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: 250,
                          child: YoutubePlayerControllerProvider(
                            controller: _controller2,
                            child: YoutubePlayer(controller: _controller2),
                          ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5) ,bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                ),
                                ]
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Sphinx',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    Column(
                      children: [
                        SizedBox(
                          width: videoWidth,
                          height: 250,
                          child: YoutubePlayerControllerProvider(
                            controller: _controller4,
                            child: YoutubePlayer(controller: _controller4),
                          ),
                        ), // Espacio entre el video y el texto
                        Container(
                          width: videoWidth,
                          decoration: BoxDecoration(color: Color.fromARGB(255, 180, 176, 176),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5) ,bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                ),
                                ]
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Apply',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 500,
                    height: 350,
                    child: Column(
                      children: [
                        YoutubePlayerControllerProvider(
                          controller: _controller3,
                          child: YoutubePlayer(controller: _controller3),
                        ),
                        ],
                        
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
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
                            ElevatedButton(onPressed: () async {
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, // Color del texto
                              backgroundColor: Colors.white,  // Color del fondo del botón
                            ), 
                            child: const Text("Statistics"))
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
                    height: 350,
                    child: Column(
                      children: [
                        const Text(
                              "Stay With Us",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              textAlign: TextAlign.center,
                              "Register your institution with us cuote your shpinx devices, improve the quality of leveling your students and increase the ranking of your institution",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(onPressed: () async {

                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, // Color del texto
                              backgroundColor: Colors.black,  // Color del fondo del botón
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
              
               Padding(
                 padding: const EdgeInsets.only(top: 1.0,bottom: 1.0),
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
                    BottomAppBar(
                      color: const Color.fromARGB(255, 60, 60, 60),
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
