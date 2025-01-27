# Capítulo 18: Introducción al StatefulWidget y su Ciclo de Vida

## Objetivo

En este capítulo, aprenderás qué es un **StatefulWidget** y cómo manejar su ciclo de vida en Flutter. Los widgets con estado son fundamentales para crear interfaces dinámicas e interactivas, ya que permiten gestionar y actualizar su estado de manera eficiente.

---

## StatefulWidget: Conceptos Básicos

Un **StatefulWidget** se compone de dos clases:
1. **La clase del widget**: Define la configuración del widget.
2. **La clase del estado**: Contiene la lógica y las variables que definen el estado mutable del widget.

### Ejemplo de un StatefulWidget:

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String texto = "Hola, mundo";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(texto),
    );
  }
}
```

### Ciclo de Vida de un StatefulWidget

El ciclo de vida de un StatefulWidget se maneja mediante la clase State, que define una serie de métodos clave. A continuación, se explica cada uno en orden de ejecución:

1. initState()
   * Descripción: Se llama una sola vez cuando el objeto State se crea.
   * Propósito: Ideal para inicializar variables, listeners o controladores.

```dart
@override
void initState() {
  super.initState();
  print("Widget inicializado");
}
```

2. didChangeDependencies()
   * Descripción: Se llama después de initState() y cuando cambian las dependencias del widget.
   * Propósito: Ideal para usar dependencias provenientes de InheritedWidgets.

```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  print("Dependencias cambiaron");
}
```

3. build()
   * Descripción: Este método se llama cada vez que el widget necesita renderizarse o actualizarse en pantalla.
   * Propósito: Define la interfaz visual del widget.

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Ejemplo StatefulWidget")),
    body: Center(child: Text("Hola, mundo")),
  );
}
```

4. didUpdateWidget()
   * Descripción: Se llama cuando el widget padre recrea el widget actual y pasa un nuevo objeto de configuración.
   * Propósito: Manejar cambios en las propiedades del widget.

4.1 ¿Cuándo se llama didUpdateWidget()?
* Cuando el widget padre crea un nuevo objeto del mismo tipo que el widget actual, pero con propiedades diferentes.
* No ocurre al cambiar el estado interno del widget, sino cuando los parámetros o propiedades recibidas cambian.

```dart
@override
void didUpdateWidget(covariant MyWidget oldWidget) {
  super.didUpdateWidget(oldWidget);
  print("Widget actualizado");
}
```

5. setState()
   * Descripción: Notifica a Flutter que el estado del widget ha cambiado y necesita reconstruirse.
   * Propósito: Actualizar dinámicamente la interfaz del usuario.

```dart
void cambiarTexto() {
  setState(() {
    texto = "Texto actualizado";
  });
}
```

6. deactivate()
   * Descripción: Se llama cuando el widget está en proceso de ser eliminado del árbol de widgets.
   * Propósito: Usado para manejar desconexiones temporales o tareas antes de la destrucción.

```dart
@override
void deactivate() {
  super.deactivate();
  print("Widget desactivado");
}
```

7. dispose()
   * Descripción: Se llama una sola vez cuando el objeto State es eliminado permanentemente.
   * Propósito: Liberar recursos como controladores, listeners o streams.

```dart
@override
void dispose() {
  super.dispose();
  print("Widget destruido");
}
```

### Resumen del Ciclo de Vida
El ciclo de vida de un StatefulWidget sigue este orden:

1. initState() → Inicialización del estado.
2. didChangeDependencies() → Configuración de dependencias.
3. build() → Construcción o actualización del widget.
4. didUpdateWidget() → Manejo de cambios en las propiedades.
5. deactivate() → Desactivación del widget antes de su eliminación.
6. dispose() → Limpieza de recursos.

### Ejemplo Completo del Ciclo de Vida:

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String texto = "Hola, mundo";

  @override
  void initState() {
    super.initState();
    print("Widget inicializado");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencias cambiaron");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ciclo de Vida")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  texto = "Texto actualizado";
                });
              },
              child: Text("Actualizar Texto"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Widget actualizado");
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
```

### Conclusión
Este capítulo marca un paso importante hacia la comprensión del desarrollo de aplicaciones dinámicas e interactivas en Flutter. El manejo de StatefulWidgets es esencial para gestionar estados y crear experiencias personalizadas para los usuarios.

#### Puntos clave:
1. Estado mutable: Los StatefulWidgets permiten cambiar dinámicamente la interfaz de usuario.
2. Ciclo de vida del estado: Conocer los métodos como initState(), build() y dispose() te permitirá manejar cada etapa del widget de manera efectiva.
3. setState(): Es la clave para actualizar la interfaz de usuario en tiempo de ejecución.
4. Optimización: Usar correctamente los métodos del ciclo de vida asegura un rendimiento eficiente de la aplicación.

En el próximo capítulo, comenzaremos a combinar estos conceptos con la interacción del usuario para manejar entradas y datos de manera avanzada. ¡Sigue practicando y explorando! 🚀