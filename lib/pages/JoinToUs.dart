import 'package:flutter/material.dart';
import 'package:kronos_software/buttoms/drawerNavigator.dart';
import 'package:kronos_software/widgets/meeting.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
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

class JoinToUs extends StatelessWidget {
    JoinToUs({super.key});

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
          width: double.infinity,
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
                    child: Text(
                          'Enroll your educational institution'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
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
               Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 100,
                      endIndent: 10,
                      height: 50,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                          'with sphinx device'.tr(), // Traducción aquí
                          style: const TextStyle(fontSize: 16),
                        ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 100,
                      height: 50,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300, // Limita el ancho para que el texto se ajuste en varias líneas
                          child: Text(
                            'Fill the form and we will contact you ASAP!'.tr(),
                            style: const TextStyle(fontSize: 35),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 150, // Limita el alto máximo de la imagen
                          child: Image.asset(
                            'assets/SphinxSinFondo.png',
                            fit: BoxFit.contain, // Mantiene la relación de aspecto de la imagen
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 370,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Column(
                      children: [
                        Text(
                          'Schedule your meeting'.tr(),
                          style: const TextStyle(fontSize: 30),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                MeetingForm(),
                                Container(
                                  width: 250, // Ajusta el ancho aquí
                                  height: 300, // Ajusta la altura aquí
                                  child: CalendarCarousel(
                                    onDayPressed: (DateTime date, List events) {
                                      // Lógica para seleccionar un día
                                      print(date);
                                    },
                                    daysHaveCircularBorder: true,
                                    weekendTextStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    headerTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                    todayButtonColor: Colors.lightBlue,
                                    selectedDayTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    selectedDayButtonColor: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
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
                                  onPressed: () {},
                                  child: Text(
                                    'Send'.tr(),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
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
                        Image.asset(
                          'assets/KronosLogo.png',
                          fit: BoxFit.contain,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
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
                        Image.asset(
                            'assets/SphinxSinFondo.png',
                            fit: BoxFit.contain,
                            height: 400.0,
                            width: 400.0, // Mantiene la relación de aspecto de la imagen
                          ),
                      ],
                    ),
                  ),
                  /* const Padding(
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
                                  "Sphinx demostrated its great performance in the classrooms giving an increase of x% in learning to students, which translates into an increase of x% in grades, registered institutions have risen X places in the ranking of educational institutions",
                                  //textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  overflow: TextOverflow.visible
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), */
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
                                // Asegúrate de envolver el Text en un SizedBox o Container con un ancho definido
                                SizedBox(
                                  width: 350, // Ajusta el ancho según sea necesario
                                  child: Text(
                                    "Sphinx demonstrated its great performance in the classrooms giving an increase of x% in learning to students, which translates into an increase of x% in grades. Registered institutions have risen X places in the ranking of educational institutions.",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.justify, // Alinea el texto para mejorar la presentación
                                    maxLines: 10, // Número máximo de líneas
                                    overflow: TextOverflow.ellipsis, // Muestra '...' si el texto excede el maxLines
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
              const Divider(
                    indent: 100,
                    endIndent: 100,
                    height: 50,
                    thickness: 0.5,
                    color: Colors.black,
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
                                'Learning statistics',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              const Text(
                                'A look at the learning growth statistics of students from registered and non-registered institutions',
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
                                'Institutions statistics',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              const Text(
                                'A look at the ranking of registered vs non registered schools',
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
                                'Satisfaction statistics',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              ),
                              SizedBox(height: 10.0),
                              const Text(
                                'A look at satisfaction ... based on student and teacher respones',
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
                              "Stay with us",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                            "Register your institution with us, quote your sphinx devices, improve the quality of learning of your students and increase the ranking of your institution",
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
                            child: const Text("Take me up",
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
