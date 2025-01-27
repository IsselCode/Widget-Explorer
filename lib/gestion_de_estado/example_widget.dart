import 'package:flutter/material.dart';
import 'package:widget_explorer/gestion_de_estado/example_widget_2.dart';
import 'package:widget_explorer/gestion_de_estado/idioma.dart';

// La clase del widget: Define la configuración del widget.
class ExampleWidget extends StatefulWidget {

  final dynamic someProperty = "d";

  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

// La clase del estado: Contiene la lógica y las variables que definen el estado mutable del widget.
class _ExampleWidgetState extends State<ExampleWidget> {

  // ya no debe ser final
  // late Idioma idioma;

  // 1
  @override
  void initState() {
    /*
    initState() es el primer método llamado cuando el State de un StatefulWidget
    se crea, pero el widget todavía no está completamente añadido al árbol.

    InheritedWidget.of(context) necesita que el widget esté ya "enganchado" al árbol
    de widgets para buscar y suscribirse correctamente al InheritedWidget.

    Flutter recomienda que la inicialización basada en dependencias se realice en
    didChangeDependencies(), porque este método se llama inmediatamente después
    de que el widget esté completamente añadido al árbol.
    */
    super.initState();
    print("Widget inicializado");
    // idioma = Idioma.of(context);
  }

  /*
   2
   En Flutter, didChangeDependencies() se invoca automáticamente cuando cambia algo en el contexto
   de las dependencias del widget (por ejemplo, cuando un InheritedWidget del cual depende se actualiza
   y updateShouldNotify devuelve true).
  */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Dependencias cambiaron");
    /*
    Se llama después de initState().
    Esto asegura que el context del widget ya está disponible y correctamente vinculado al árbol.

    Se llama automáticamente cuando cambian las dependencias.
    Si el InheritedWidget del que depende tu widget cambia, Flutter invoca automáticamente
    didChangeDependencies() para que puedas reaccionar.
     */
    // idioma = Idioma.of(context);
  }

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    /*
    Si solo necesitas mostrar valores del InheritedWidget en la UI
    y no necesitas almacenarlos en variables internas del estado,
    puedes usar directamente build() para acceder al InheritedWidget:
    */
    Idioma idioma = Idioma.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_counter.toString()),
            ElevatedButton(
                onPressed: () {
                  _counter ++;
                  setState(() {});
                },
                child: Text("Incrementar")
            ),

            const SizedBox(height: 10,),

            Text(idioma.idioma),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                // Se cambió a un push Replacement para mostrar eliminar y destruir el widget del arbol de widgets
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ExampleWidget2(),)
                );
              },
              child: Text("Ir a ejemplo 2")
            )
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ExampleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    /*
    Incluso si no realizas cambios directos en el widget, el hot reload crea
    una nueva instancia del widget raíz (por ejemplo, ExampleWidget).
    Esto activa el método didUpdateWidget porque Flutter interpreta que la configuración
    del widget (es decir, su instancia) ha cambiado, aunque sus propiedades sean las mismas.
    */
    print("Widget actualizado");

    /*
    Puedes comparar las propiedades del widget anterior (oldWidget) con las del nuevo (widget)
    para ejecutar alguna lógica solo si hubo un cambio real:

    Si la propiedad someProperty no cambia durante el hot reload, no se ejecutará la lógica adicional.
    */
    if (oldWidget.someProperty != widget.someProperty) {
      // Solo actúa si las propiedades del widget cambiaron
      print("Propiedad actualizada");
    }

  }

  @override
  void deactivate() {
    super.deactivate();
    print("Widget desactivado");
  }

  @override
  void dispose() {
    super.dispose();
    print("Widget destruido");
  }

}
