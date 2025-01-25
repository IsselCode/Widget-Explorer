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
      // Se define el cuerpo de la vista principal con un Padding para agregar espacio alrededor.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Agrega un margen uniforme de 16 píxeles alrededor del contenido.
        child: Column(
          children: [
            // Se agrega un TextField para el campo de búsqueda.
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar Widget", // Texto de sugerencia que indica la función del campo.
                filled: true,  // Activa el fondo relleno del TextField.
                fillColor: Colors.white, // Color de fondo blanco para resaltar el campo.
                prefixIcon: Icon(
                  Icons.search, // Ícono de búsqueda colocado a la izquierda del campo.
                  color: Colors.grey, // Color gris para el ícono.
                ),
                border: OutlineInputBorder(
                 borderSide: BorderSide.none, // Sin bordes visibles.
                 borderRadius: BorderRadius.circular(20) // Bordes redondeados para un diseño moderno.
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
