import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_explorer/entities/category_entity.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff4f5f7),
      appBar: AppBar(
        // Establecemos un color transparente a la superficie
        // para que al hacer scroll no cambie de color
        surfaceTintColor: Colors.transparent,
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
                // Generación dinámica de tarjetas utilizando List.generate.
                // Esto recorre la lista de categorías y crea una tarjeta por cada objeto.
                children: List.generate(
                  categories.length, // Número total de categorías en la lista.
                  (index) {
                  CategoryEntity category = categories[index]; // Obtiene la categoría actual.
                    /*
                    Se crea una instancia de _LayoutCard para cada categoría.
                    Esto asegura que cada tarjeta sea personalizada con los datos de la categoría correspondiente.
                    */
                    return _LayoutCard(
                      image: category.image,
                      title: category.title,
                      subtitle: category.subtitle,
                    );
                  },
                ),

              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
              /*
                Card: Widget utilizado para crear un contenedor con bordes redondeados y un color de fondo.
                En este caso, envuelve el ListView, dándole un fondo blanco que lo distingue visualmente del resto de la interfaz.
              */
              child: Card(
                elevation: 3,
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [

                    _WidgetTile(
                      title: "Material",
                      subtitle: "Material Components",
                      onTap: () {
                        print("Mostrar Widget Expanded");
                      },
                    ),

                    Divider(color: Colors.black12,), // Separador visual entre elementos de la lista.

                    _WidgetTile(
                      title: "Expanded",
                      subtitle: "Material Components",
                      favorite: true,
                      onTap: () {
                        print("Mostrar Widget Expanded");
                      },
                    ),

                    Divider(color: Colors.black12,),

                    _WidgetTile(
                      title: "Card",
                      subtitle: "Material Components",
                      onTap: () {
                        print("Mostrar Widget Card");
                      },
                    ),

                    Divider(color: Colors.black12,),

                    _WidgetTile(
                      title: "Divider",
                      subtitle: "Material Components",
                      favorite: true,
                      onTap: () {
                        print("Mostrar Widget Divider");
                      },
                    ),

                    Divider(color: Colors.black12,),

                    _WidgetTile(
                      title: "ListTile",
                      subtitle: "Material Components",
                      favorite: true,
                      onTap: () {
                        print("Mostrar Widget ListTile");
                      },
                    ),

                    Divider(color: Colors.black12,),

                    _WidgetTile(
                      title: "AlertDialog",
                      subtitle: "Material Components",
                      onTap: () {
                        print("Mostrar Alert Dialog");
                      },
                    )

                  ],
                ),
              ),
            )

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

// Widget personalizado _WidgetTile para encapsular la lógica y el diseño de los ListTile.
// Este widget permite simplificar la creación de "tiles" con contenido dinámico
// reduciendo la repeticion de código y facilitando la personalización
class _WidgetTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final bool favorite;
  final VoidCallback onTap;

  const _WidgetTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.favorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: favorite ? Icon(Icons.favorite, color: Colors.red,) : null,
      tileColor: Color(0xfff4f5f7),
      onTap: onTap,
    );
  }
}
