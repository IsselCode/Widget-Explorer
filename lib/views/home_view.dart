import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cambiar el color para que el iconButton sea visible
      backgroundColor: Color(0xfff4f5f7),
      appBar: AppBar(
        // Cambiar el color para que el iconButton sea visible
        backgroundColor: Color(0xfff4f5f7),
        titleSpacing: 16,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bienvenido!"),
            Text("Gregory Martínez"),
          ],
        ),
        actions: [
          /// Primero aplicar el icon button
          // Aplicar un paddig al botón
          Padding(
            padding: const EdgeInsets.only(right: 16),
            /*
            Botón meramente demostrativo
            con fin de mostrar cómo realizar un IconButton
            No se implementará ningún tipo de notificaciones en la aplicación
            */
            child: IconButton(
              iconSize: 30,
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                print("Abriendo notificaciones");
              },
              icon: Icon(Icons.notifications_outlined)
            ),
          )
        ],
        /// Mostrar propiedad:
        // backgroundColor: Colors.red,
        /// Mostrar propiedad:
        // centerTitle: true,

      ),
    );
  }
}
