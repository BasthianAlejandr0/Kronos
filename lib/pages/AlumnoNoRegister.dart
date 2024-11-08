import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/drawerNavigator.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import '../buttoms/aboutusPageButtom.dart';
import '../buttoms/homeButtomPAge.dart';
import '../buttoms/institutionsButtomPage.dart';
import '../buttoms/joinUsButtomPage.dart';
import '../buttoms/loginButtom.dart';
import '../buttoms/projetsButtomPage.dart';
import '../buttoms/signinButtom.dart';
import '../widgets/Idioma.dart';
import '../widgets/formField.dart';

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
        child: Container(
          margin: const EdgeInsets.all(10),
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
              const Divider(
                indent: 100,
                endIndent: 100,
                height: 50,
                thickness: 0.5,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Column(
                      children: [
                        Text(
                          'Perfil de Alumno'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 40),
                        ),
                         SizedBox(
                          width: 300,
                          child: Text(
                            'Solo para instituciones registradas dentro del proyecto Sphinx'.tr(), // Traducción aquí
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          '¿Tu institución no está Inscrita?'.tr(), // Traducción aquí
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Juntos mejoramos la educación'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(192, 0, 0, 0)),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.all(10)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Contáctanos'.tr(), // Traducción aquí
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 270,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Column(
                      children: [
                        Text(
                          'Alumno'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 40),
                        ),
                        Column(
                          children: [
                            DropDownInstitutions(),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(192, 0, 0, 0)),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                  },
                                  child: Text(
                                    'Enviar'.tr(), // Traducción aquí
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(192, 255, 255, 255)),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'No estoy registrado'.tr(), // Traducción aquí
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text(
                          'Soy alumno no registrado'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 40,)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                    indent: 100,
                    endIndent: 100,
                    height: 50,
                    thickness: 0.5,
                    color: Colors.black,
                  ),

              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Column(
                      children: [
                        Text(
                          'Sigue las siguientes instrucciones'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 25,),
                          //textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 97),
                    child: Column(
                      children: [  
                        Column(
                          children: [
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1.- Llena el formulario. \n2.- Comunícate con el/la Director(a) de tu institución. \n3.- Crea tu cuenta. \n4.- Pronto tendrás tus informes actualizados en tu perfil.",
                                  //textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
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
      ),
    );
  }
}
