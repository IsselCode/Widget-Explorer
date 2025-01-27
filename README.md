# Capítulo 20: Uso del SingleChildScrollView

## Objetivo

En este capítulo, aprenderás a utilizar el widget **SingleChildScrollView** para manejar correctamente el problema del teclado virtual que reduce el espacio disponible en la interfaz. Este enfoque permite desplazarse por el contenido incluso cuando el teclado está visible, mejorando la experiencia del usuario.

---

## Desarrollo

### Cambios Realizados

1. **Uso de SingleChildScrollView**:
   - Se envolvió el contenido principal con un **SingleChildScrollView** para permitir el desplazamiento cuando el teclado reduce el espacio visible.

2. **Reemplazo de Expanded**:
   - Se reemplazó el **Expanded** por un **SizedBox** con altura definida para ajustar el diseño según las necesidades de la interfaz.

3. **Manejo del ListView**:
   - El **ListView.separated** se mantiene dentro de un **Card**, proporcionando un diseño consistente con bordes redondeados y un fondo blanco.

---

## Conclusión

El **SingleChildScrollView** es una solución sencilla y efectiva para manejar contenido desplazable cuando el teclado virtual aparece, asegurando que los elementos de la interfaz sigan siendo accesibles. Este capítulo demuestra cómo combinar este widget con otros para mantener un diseño organizado y funcional.

En el próximo capítulo, exploraremos más formas de optimizar la interfaz para casos avanzados. ¡Sigue aprendiendo y construyendo! 🚀
