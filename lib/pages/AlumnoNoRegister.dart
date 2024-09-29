import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/aboutusPageButtom.dart';
import 'package:kronos_software/buttoms/institutionsButtomPage.dart';
import 'package:kronos_software/buttoms/joinUsButtomPage.dart';
import 'package:kronos_software/buttoms/projetsButtomPage.dart';
import 'package:kronos_software/buttoms/homeButtomPAge.dart';
import 'package:kronos_software/widgets/Idioma.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Alumnonoregister extends StatelessWidget {
    Alumnonoregister({super.key});

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
        backgroundColor: Color.fromARGB(255, 60, 60, 60),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/KronosBlanco.png',
              fit: BoxFit.contain,
              height: 110,
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 107.0),
                  child: SizedBox(
                    child: Text(
                      "Sigue las siguientes instrucciones.",
                      textAlign: TextAlign.left, // Alinea el texto para mejorar la presentación
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    height: 150,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 3,
                      width: 20, // Cambia el ancho del divisor
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  width: 500.0,
                  child: Text(
                    "1.- Llena el formulario. \n2.- Comunícate con el/la Director(a) de tu institución. \n3.- Crea tu cuenta. \n4.- Pronto tendrás tus informes actualizados en tu perfil.",
                    //textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                    style: TextStyle(
                      fontSize: 15,
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
                          decoration: BoxDecoration(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Formulario',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            const Text(
                              'Identificación de alumno',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
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
                          decoration: BoxDecoration(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Crea tu cuenta',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            const Text(
                              'Crea tu cuenta de alumno',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
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
                          decoration: BoxDecoration(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Preguntas y respuestas',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            ),
                            SizedBox(height: 10.0),
                            const Text(
                              'Echa un vistazo a las preguntas más frecuentes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      const Text(
                            "Gracias!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text(
                          "Por formar parte del desarrollo del proyecto SPHINX.\nJuntos mejoramos la educación",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(onPressed: () async {
        
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, // Color del texto
                            backgroundColor: Colors.black,  // Color del fondo del botón
                          ), 
                          child: const Text("Contáctanos",
                          style: TextStyle(
                            fontSize: 17.0
                          ),) 
                          )
                      ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.0,),
            // IconButtons y BottomAppBar
             Column(
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
          ],
        ),
      ),
    );
  }
}
