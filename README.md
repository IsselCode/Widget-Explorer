# Capítulo 22: Uso de TextEditingController

## Objetivo

En este capítulo, aprenderás a usar el **TextEditingController** para gestionar y acceder dinámicamente al contenido de un campo de texto. Además, se solucionó un problema relacionado con el filtrado dinámico por texto y categoría, asegurando un comportamiento consistente incluso al seleccionar o deseleccionar categorías mientras hay un valor en el campo de texto.

---

## Desarrollo

### Cambios Realizados

1. **Implementación de TextEditingController**:
   - Se añadió un **TextEditingController** para manejar el valor actual del campo de texto.
   - Este controlador permite acceder al texto ingresado sin necesidad de depender únicamente de los eventos como `onSubmitted`.

2. **Resolución del Problema de Filtrado**:
   - Al seleccionar o deseleccionar una categoría, ahora se utiliza el valor actual del campo de texto mediante el `TextEditingController`.
   - Esto asegura que el filtrado sea consistente y que los resultados mostrados sean correctos.

3. **Flujo Mejorado de Selección**:
   - Al seleccionar o deseleccionar una categoría, se invoca el método de búsqueda (`buscarWidgets`) con el texto actual del campo de texto para actualizar la lista filtrada en tiempo real.

---

## Conclusión

El uso de **TextEditingController** permite gestionar de manera eficiente el contenido de los campos de texto, resolviendo problemas de sincronización entre el texto ingresado y otras interacciones de la interfaz, como la selección de categorías. Este capítulo destaca la importancia de manejar adecuadamente los controladores para garantizar un comportamiento coherente y fluido en aplicaciones interactivas.

En el siguiente capítulo, exploraremos más técnicas para mejorar la gestión del estado y la interactividad en Flutter. ¡Sigue desarrollando y aprendiendo! 🚀
