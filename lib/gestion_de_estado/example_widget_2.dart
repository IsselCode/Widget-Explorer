import 'package:flutter/material.dart';
import 'package:widget_explorer/gestion_de_estado/idioma.dart';

class ExampleWidget2 extends StatelessWidget {
  const ExampleWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el valor actual de 'idioma' desde el InheritedWidget Idioma.
    final Idioma idioma = Idioma.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Example Widget 2"),),
      body: Center(child: Text(idioma.idioma),),
    );
  }

}
