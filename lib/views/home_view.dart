import 'package:flutter/material.dart';
import 'package:widget_explorer/entities/category_entity.dart';
import 'package:widget_explorer/entities/widget_entity.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  // Lista dinámica que se actualiza en tiempo real con los elementos filtrados.
  late List<WidgetEntity> widgetEntities;
  // Una propiedad que representa la categoría seleccionada
  String? selectedCategory;

  // Método del ciclo de vida: Inicializa los datos al cargar el widget.
  @override
  void initState() {
    // Inicializa widgetEntities con todos los elementos de la lista original.
    widgetEntities = widgets;

    super.initState();
  }

  /*
    Método buscarWidgets:
    - Filtra los elementos de la lista original (widgets) que comienzan con el valor ingresado.
    - Utiliza setState() para reconstruir el widget con los resultados filtrados.
  */
  void buscarWidgets(String value) {

    widgetEntities = widgets.where((element) {
      // Retorna solo los elementos cuyo título comience con el valor ingresado.
      // Se puede filtrar de esta manera, pero al des-seleccionar ya no obtendriamos todos los widgets
      // return element.title.startsWith(value) && element.subtitle == (selectedCategory ?? "");
      // Tambien de esta otra manera, pero no sería lo correcto, la categoría debe ser exacta
      // return element.title.startsWith(value) && element.subtitle.startsWith(selectedCategory ?? "");

      // Se condiciona o verifica la nulidad de la categoría seleccionada
      // Sí no es nula, quiere decir que el usuario seleccionó alguna.
      if (selectedCategory != null) {
        // De no ser nula, filtrar por el valor y categoría
        return element.title.startsWith(value) && element.subtitle == selectedCategory;
      } else {
        // De ser nula, solo filtrar por el valor del campo de texto
        return element.title.startsWith(value);
      }

    },).toList();

    // Notifica a Flutter que el estado ha cambiado y la interfaz debe reconstruirse.
    setState(() {});
  }

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
        /*
        SingleChildScrollView:
        Permite que la pantalla sea desplazable cuando el teclado reduce el espacio disponible.
        */
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Se agrega un TextField para el campo de búsqueda.
              TextField(
                // TextField: Campo de texto para que el usuario ingrese el filtro.
                onSubmitted: buscarWidgets,
                // onChanged: buscarWidgets,
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

                    // Se comprueba si la categoría seleccionada
                    // Es la misma que la que se seleccionó
                    if (selectedCategory == categories[value].title){
                      // de ser la misma, des-seleccionarla
                      selectedCategory = null;
                    } else {
                      // de no ser la misma, asignarla a la categoría seleccionada
                      selectedCategory = categories[value].title;
                    }
                    // Llamar al método para buscar los widgets
                    buscarWidgets("");
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
                        // Comparar por el nombre
                        selected: category.title == selectedCategory,
                        image: category.image,
                        title: category.title,
                        subtitle: category.subtitle,
                      );
                    },
                  ),

                ),
              ),

              const SizedBox(height: 20,),

              // Altura fija del contenedor del ListView.
              SizedBox(
                height: 400,
                /*
                  Card: Widget utilizado para crear un contenedor con bordes redondeados y un color de fondo.
                  En este caso, envuelve el ListView, dándole un fondo blanco que lo distingue visualmente del resto de la interfaz.
                */
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  /*
                    ListView.separated: Variante de ListView que permite agregar separadores entre los elementos.
                    Es útil para listas donde se necesita un diseño más organizado y con espacios consistentes.
                   */
                  child: ListView.separated(
                    padding: EdgeInsets.all(20),
                    // Número total de elementos en la lista.
                    itemCount: widgetEntities.length,
                    /*
                      separatorBuilder: Esta devolución de llamada define el separador entre elementos de la lista.
                      Recibe el contexto y el índice actual, y debe devolver un widget que actuará como separador.
                      En este caso, se usa un SizedBox con altura fija para crear espacio entre los elementos.
                    */
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10,);
                    },
                    // La devolución de llamada itemBuilder se llamará solo con índices
                    // mayores o iguales a cero y menores que itemCount
                    itemBuilder: (context, index) {
                      WidgetEntity widgetEntity = widgetEntities[index]; // Obtiene el elemento actual.
                      return _WidgetTile(
                        title: widgetEntity.title,
                        subtitle: widgetEntity.subtitle,
                        favorite: widgetEntity.favorite,
                        onTap: () {
                          print("Mostrar ${widgetEntity.title}");
                        },
                      );
                    },
                  ),
                ),
              )

            ],
          ),
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

  // Crear propiedad para indicar si la tarjeta está seleccionada o no
  final bool selected;

  const _LayoutCard({
    required this.selected,
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
                  // cambiar color si está seleccionada
                  color: selected ? Colors.blue : Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                softWrap: false,
                style: TextStyle(
                  // cambiar color si está seleccionada
                  color: selected ? Colors.blue : Colors.white,
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
