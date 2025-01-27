import 'package:flutter/material.dart';
import 'package:widget_explorer/gestion_de_estado/example_widget.dart';
import 'package:widget_explorer/views/home_view.dart';

import 'gestion_de_estado/idioma.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
      El 'child' que va envuelto por Idioma es el MaterialApp.
      De esta forma, ExampleWidget y cualquier otro widget
      pueden acceder al valor de 'idioma' a través de Idioma.of(context).
    */
    return Idioma(
      idioma: "Español",
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeView(),
      )
    );
  }
}