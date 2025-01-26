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
                children: [
                  // Superponer widgets unos sobre otros, permitiendo apilar elementos en diferentes posiciones.
                  Stack(
                    alignment: AlignmentDirectional.bottomStart, // Alinea los widgets secundarios en la parte inferior izquierda de la pila.
                    children: [
                      /*
                      El OverflowBox en Flutter se utiliza para permitir que un
                      widget hijo se salga de los límites de su contenedor padre,
                      ignorando las restricciones impuestas por este.
                      Es útil cuando necesitas mostrar contenido más grande que el
                      espacio disponible sin recortar ni deformar el diseño.
                       */
                      OverflowBox(
                        maxWidth: 500,
                        child: Image.network(
                          "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png", // URL de la imagen.
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Agrega un margen interno de 16 píxeles alrededor del texto.
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto hacia el inicio del eje horizontal.
                          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del eje vertical al contenido mínimo necesario.
                          children: [
                            Text(
                              "Material Components", // Título principal superpuesto en la imagen.
                              softWrap: false, // Evita que el texto se ajuste al ancho disponible, forzando una sola línea.
                              style: TextStyle(
                                color: Colors.white, // Texto en color blanco para destacar sobre el fondo.
                                fontSize: 30, // Tamaño de fuente del título.
                                fontWeight: FontWeight.w500, // Grosor medio del texto.
                              ),
                            ),
                            Text(
                              "Sección 1 | Capítulo 1", // Subtítulo debajo del título principal.
                              softWrap: false, // Misma configuración para mantener el texto en una sola línea.
                              style: TextStyle(
                                color: Colors.white, // Color blanco para el subtítulo.
                                fontSize: 20, // Tamaño de fuente del subtítulo.
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blueAccent, // Fondo azul en caso de error de carga.
                    child: Image.network(
                      "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png", // URL de la imagen.
                      fit: BoxFit.cover, // La imagen se ajusta para cubrir todo el espacio del contenedor.
                    ),
                  ),
                  Container(
                    color: Colors.blueAccent, // Fondo azul en caso de error de carga.
                    child: Image.network(
                      "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png", // URL de la imagen.
                      fit: BoxFit.cover, // La imagen se ajusta para cubrir todo el espacio del contenedor.
                    ),
                  ),
                  Container(
                    color: Colors.blueAccent, // Fondo azul en caso de error de carga.
                    child: Image.network(
                      "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png", // URL de la imagen.
                      fit: BoxFit.cover, // La imagen se ajusta para cubrir todo el espacio del contenedor.
                    ),
                  ),
                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
}
