# Capítulo 3: Widget Padding e IconButton

## Objetivo

En este capítulo, aprenderás a utilizar los widgets **Padding** e **IconButton** en Flutter. Se implementará un botón icónico dentro del **AppBar**, que será envuelto en un **Padding** para separarlo del borde. Además, se personalizarán los colores del **Scaffold** y del **AppBar** para que el botón sea visible, resaltando su funcionalidad.

---

## Desarrollo

### Paso 1: Modificar el AppBar para incluir un IconButton
1. Dentro del **AppBar** de la vista principal, agrega un **IconButton** en la propiedad `actions`. Este botón permitirá realizar alguna acción.
2. El botón será un ícono de notificacion con un fondo blanco para que contraste con el fondo del **AppBar**.

---

### Paso 2: Agregar Padding al IconButton
1. Envuelve el **IconButton** con un widget **Padding** para separarlo del borde derecho del **AppBar**.
2. Define un valor adecuado de `padding` (como `EdgeInsets.only(right: 16.0)`) para crear un diseño limpio y estético.

---

### Paso 3: Cambiar los colores del Scaffold y el AppBar
1. Cambia el color del **Scaffold** para darle un fondo que contraste con el contenido.
2. Ajusta el color del **AppBar** para que el ícono del **IconButton** sea completamente visible.

---

### Paso 4: Verificar los cambios
1. Asegúrate de que los colores del fondo y del botón sean consistentes y visualmente agradables.
2. Prueba el botón para confirmar que su funcionalidad y diseño son correctos.

---

## Conclusión

En este capítulo, hemos explorado el uso de los widgets **Padding** e **IconButton** para mejorar el diseño y la funcionalidad del **AppBar**. También aprendimos a personalizar los colores del **Scaffold** y del **AppBar**, asegurándonos de que los elementos sean claramente visibles y estéticamente agradables.

Estos ajustes no solo mejoran la apariencia de la aplicación, sino que también demuestran cómo pequeños detalles en el diseño pueden tener un gran impacto en la experiencia del usuario. En el próximo capítulo, profundizaremos en el uso de más widgets para construir interfaces dinámicas y funcionales. ¡Sigue construyendo y aprendiendo! 🚀
