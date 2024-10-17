import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../buttoms/aboutusPageButtom.dart';
import '../buttoms/homeButtomPAge.dart';
import '../buttoms/institutionsButtomPage.dart';
import '../buttoms/joinUsButtomPage.dart';
import '../buttoms/loginButtom.dart';
import '../buttoms/projetsButtomPage.dart';
import '../buttoms/signinButtom.dart';
import '../widgets/Idioma.dart';
import '../widgets/formField.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

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
                  Idioma(), // Widget para cambio de idioma
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
              child: Image.asset("assets/KronosLogo.png"),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: Text('Messages'.tr()), // Traducción aquí
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text('Profile'.tr()), // Traducción aquí
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text('Settings'.tr()), // Traducción aquí
            ),
          ],
        ),
      ),
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
                            'Contactanos'.tr(), // Traducción aquí
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
                                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
