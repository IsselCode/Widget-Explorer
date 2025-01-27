import 'package:flutter/material.dart';
import 'package:widget_explorer/gestion_de_estado/example_widget_2.dart';
import 'package:widget_explorer/gestion_de_estado/idioma.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Acceso al valor de 'idioma':
      Mediante 'Idioma.of(context)', se obtiene la instancia de InheritedWidget,
      permitiendo leer la propiedad 'idioma'.
    */
    final Idioma idioma = Idioma.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(idioma.idioma),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
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
}
