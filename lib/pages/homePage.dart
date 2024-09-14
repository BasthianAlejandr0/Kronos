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
  )..loadVideoById(videoId: "a9MulJJ1J5g");

  final YoutubePlayerController _controller2 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..loadVideoById(videoId: "5UktyVCfFUc");

  final YoutubePlayerController _controller3 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..loadVideoById(videoId: "BEpcN-eE8ms");

  final YoutubePlayerController _controller4 = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      loop: true,
      strictRelatedVideos: true,
    ),
  )..loadVideoById(videoId: "dQw4w9WgXcQ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
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
                color: Color.fromARGB(255, 88, 88, 88),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Center(
                    child: Image.asset(
                    'assets/KronosLogo.png',
                    fit: BoxFit.contain,
                    height: 100,
                    
                  ),
                  ),
                  ),
                  Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      loginButtom(),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Meet our last device',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Sphinx.jpeg',
                    fit: BoxFit.contain,
                    height: 100,
                  ),
                  SizedBox(width: 100,), // Ajusta el espacio entre la imagen y el texto
                  SizedBox(
                    width: 500.0,
                    child: Text(
                      "The innovative device that will revolutionize education. Solve riddles, unleash your imagination, improve your logical-critical thinking, improve your social skills, improve your grades and much more. Sphinx is a device aimed at educational institutions.",
                      //textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 600 ? 16 : 18, // Cambia el tamaño de fuente dependiendo del ancho de la pantalla
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
                      SizedBox(
                        width: videoWidth,
                        height: 250,
                        child: YoutubePlayerControllerProvider(
                          controller: _controller1,
                          child: YoutubePlayer(controller: _controller1),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: videoWidth,
                        height: 250,
                        child: YoutubePlayerControllerProvider(
                          controller: _controller2,
                          child: YoutubePlayer(controller: _controller2),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: videoWidth,
                        height: 250,
                        child: YoutubePlayerControllerProvider(
                          controller: _controller4,
                          child: YoutubePlayer(controller: _controller4),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 100),
              // MAPA Y TEXTO "SINCE 202X THE YEAR"
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Texto "Since 202X the year"
                      Text(
                        "Since 202X the year",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "We have been working on the development of innovative devices that will revolutionize the world. Sphinx is the first of many devices that we will launch.",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  // Barra espaciadora ajustada
                  SizedBox(
                    height: 200,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                      width: 20, // Cambia el ancho del divisor
                    ),
                  ),
                  SizedBox(width: 20), // Añade espacio después del divisor
                  // Mapa (o cualquier otro contenido)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Where are we",
                        style: TextStyle(
                          fontSize: 25,
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
              const SizedBox(height: 100),
              // IconButtons y BottomAppBar
               Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 75, 75, 75), // Color de fondo para depuración
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.email, color: Colors.white),
                          onPressed: () {
                            // Acción para el botón de email
                          },
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.instagram, color: Colors.white),
                          onPressed: () async {
                            const url = 'https://www.instagram.com/minerales.cl/';
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
                    color: const Color.fromARGB(255, 75, 75, 75),
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
      ),
    );
  }
}
