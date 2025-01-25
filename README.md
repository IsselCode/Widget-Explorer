# Capítulo 2: AppBar Widget

## Objetivo

En este capítulo, aprenderás cómo implementar un **AppBar** en una nueva vista (*view*). Esta vista será el punto de inicio de la aplicación que desarrollaremos a lo largo de esta sección. También organizaremos el proyecto creando una carpeta específica para las vistas, manteniendo una estructura limpia y ordenada.

---

## Desarrollo

### Paso 1: Limpiar el código innecesario
El proyecto generado por defecto incluye código de ejemplo que no será necesario. Comienza eliminando cualquier elemento que no sea relevante para la estructura de la aplicación, dejando un entorno limpio para trabajar.

---

### Paso 2: Crear una carpeta para organizar las vistas
Para mantener una estructura clara en el proyecto, crea una nueva carpeta llamada `views` dentro del directorio `lib`. Esta carpeta contendrá las vistas de la aplicación.

- Ruta sugerida: `lib/views`
- Dentro de esta carpeta, crea un archivo para la vista inicial de la aplicación. Nombrarlo de manera descriptiva, como `home_view.dart`, ayudará a identificar fácilmente su propósito.

---

### Paso 3: Crear la primera vista de la aplicación
Define una nueva vista en el archivo creado en el paso anterior. Esta vista será el punto de inicio de la aplicación y contendrá un **AppBar** básico.

---

### Paso 4: Implementar el AppBar
En la nueva vista:
- Agrega un **AppBar**.
- Personaliza el **AppBar** con opciones básicas, como:
    - Centrar el título.
    - Cambiar el color de fondo.

Actualiza la propiedad `home` del widget `MaterialApp` en el archivo `main.dart` para que apunte a esta nueva vista.

---

## Conclusión

En este capítulo, organizamos el proyecto creando una carpeta específica para las vistas y configuramos la primera vista de la aplicación, implementando un **AppBar** básico. Este es un paso importante para mantener un código limpio y estructurado, facilitando el desarrollo y la escalabilidad de la aplicación.

En los próximos capítulos, exploraremos cómo personalizar el **AppBar** y agregar elementos interactivos, como botones de acción y menús. ¡Sigue adelante y disfruta del proceso de aprendizaje! 🚀
