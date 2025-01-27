# Capítulo 19: Filtrado Dinámico de Widgets

## Objetivo

En este capítulo, aprenderás a implementar un **StatefulWidget** para manejar estados dinámicos y actualizar la interfaz de usuario en respuesta a interacciones del usuario. Además, se incluye un ejemplo práctico que permite filtrar dinámicamente una lista de elementos basada en el texto ingresado en un campo de texto.

---

## Desarrollo

### Cambios Realizados

1. **Conversión a StatefulWidget**:
   - Se convirtió el **StatelessWidget** a **StatefulWidget** para manejar el ciclo de vida y el estado mutable del widget.
   - Esto permite actualizar dinámicamente la interfaz de usuario mediante el método `setState()`.

2. **Propiedad `late`**:
   - Se definió una propiedad `late List<WidgetEntity> widgetEntities` para gestionar los elementos que se mostrarán en el `ListView`.
   - Usar `late` indica que esta variable se inicializará más tarde, asegurando su disponibilidad antes de ser utilizada.

3. **Inicialización en `initState()`**:
   - En el método `initState()`, la lista `widgetEntities` se inicializa con todos los elementos disponibles.
   - Este método es ideal para configuraciones iniciales que solo deben ejecutarse una vez.

4. **Filtrado Dinámico con un TextField**:
   - Se añadió un campo de texto con un método `onSubmitted`, que se llama al presionar "Enter".
   - Este método filtra los elementos de la lista que comienzan con el texto ingresado y actualiza el estado del widget.

---

## Conclusión

El uso de **StatefulWidget** permite manejar estados dinámicos y crear interfaces interactivas. Este capítulo muestra cómo inicializar datos, actualizarlos en tiempo real y reflejar los cambios en la interfaz gráfica. En el próximo capítulo, resolveremos el problema del teclado que afecta al espacio del `ListView` al escribir en el `TextField`. ¡Hasta pronto! 🚀
