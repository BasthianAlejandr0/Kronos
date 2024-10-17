import 'package:flutter/material.dart';
import 'productos.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: Color.fromARGB(255, 122, 122, 122),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              
            ),
            child: Image.asset(
              "assets/KronosLogo.png",
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Productos'),
            onTap: () {
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}