import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            ),

            // Espaciado adicional antes del carrusel.
            const SizedBox(height: 20,),

            // Contenedor del Carousel View.
            SizedBox(
              height: 400,
              child: CarouselView.weighted(
                // Ajustar el redondeado de esquinas del carrusel
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                itemSnapping: true,
                flexWeights: const [1, 7, 1],
                onTap: (value) {
                  print(value);
                },
                // Ejemplo de uso del widget _LayoutCard para crear varias tarjetas con contenido dinámico.
                // Esto reduce la repetición de código y asegura un diseño consistente.
                children: [
                  _LayoutCard(
                    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png",
                    title: "Material Components",
                    subtitle: "Sección 1 | 10 Widgets",
                  ),
                  _LayoutCard(
                    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png",
                    title: "Material Components",
                    subtitle: "Sección 2 | 12 Widgets",
                  ),
                  _LayoutCard(
                    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png",
                    title: "Material Components",
                    subtitle: "Sección 3 | 15 Widgets",
                  ),
                  _LayoutCard(
                    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png",
                    title: "Material Components",
                    subtitle: "Sección 4 | 7 Widgets",
                  ),
                ]

              ),
            ),

          ],
        ),
      ),
    );
  }
}

// Widget personalizado _LayoutCard para encapsular la lógica y el diseño de las tarjetas.
// Este widget permite simplificar la creación de tarjetas con contenido dinámico,
// reduciendo la repetición de código y facilitando la personalización.
class _LayoutCard extends StatelessWidget {
  final String image; // Imagen dinámica que se mostrará como fondo de la tarjeta.
  final String title; // Título dinámico de la tarjeta.
  final String subtitle; // Subtítulo dinámico de la tarjeta.

  // Constructor que recibe las propiedades necesarias para personalizar cada tarjeta.
  const _LayoutCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        OverflowBox(
          maxWidth: 400,
          // Asignamos el minimo de ancho para que la imagen se ajuste correctamente
          minWidth: 400,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                softWrap: false,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                softWrap: false,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}