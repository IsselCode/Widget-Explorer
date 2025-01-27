import 'package:flutter/material.dart';
/*

  El InheritedWidget es una clase base que Flutter proporciona para compartir
  datos entre widgets en el árbol sin tener que pasarlos manualmente a través
  de los constructores. Es la base para herramientas avanzadas de gestión de estado como Provider.

  Clase Idioma:
  Este InheritedWidget se encarga de proporcionar el valor de 'idioma'
  a todos los widgets que lo necesiten, sin tener que pasar la información
  manualmente por cada constructor.
*/
class Idioma extends InheritedWidget {

  // Valor compartido que representa el 'idioma'.
  final String idioma;

  /*
    Constructor de Idioma:
    - 'idioma': valor que se compartirá con los widgets.
    - 'child': el widget que está envuelto por Idioma, normalmente será la raíz
      de la aplicación o la parte del árbol donde necesitamos compartir este valor.
  */
  const Idioma({
    required this.idioma,
    required Widget child,
  }) : super(child: child);

  /*
    Método estático 'of':
    - Permite a otros widgets obtener una instancia de Idioma mediante el contexto.

    - 'dependOnInheritedWidgetOfExactType' registra la dependencia
      para que esos widgets se reconstruyan cuando el valor de 'idioma' cambie.
  */
  static Idioma of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Idioma>()!;
  }

  /*
    updateShouldNotify:
    - Se llama cuando hay un cambio en una propiedad de Idioma (en este caso 'idioma').
    - Devuelve true si los widgets dependientes deben reconstruirse al detectar un cambio.
  */
  @override
  bool updateShouldNotify(Idioma oldWidget) {
    return oldWidget.idioma != idioma;
  }
}
