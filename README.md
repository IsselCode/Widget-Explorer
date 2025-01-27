# Capítulo 21: Filtrado Dinámico por Categoría Seleccionada

## Objetivo

En este capítulo, aprenderás a implementar un filtrado dinámico basado en dos criterios:
1. **Categoría seleccionada**: Filtrar los widgets según la categoría elegida.
2. **Texto ingresado**: Mostrar únicamente los widgets cuyo título comience con el texto ingresado en el campo.

Además, se mejora la experiencia visual al cambiar el color de los textos para la categoría seleccionada.

---

## Desarrollo

### Cambios Realizados

1. **Propiedad `selectedCategory`**:
   - Se añadió una propiedad de tipo `String?` que representa la categoría seleccionada por el usuario.

2. **Verificación de nulidad**:
   - Al filtrar los widgets, se verificó si hay una categoría seleccionada:
      - **Si es nula**: Filtrar únicamente por el valor del campo de texto.
      - **Si no es nula**: Filtrar tanto por el valor del campo de texto como por la categoría seleccionada.

3. **Selección y des-selección de categorías**:
   - Al seleccionar una categoría, se comprueba si es la misma que la actualmente seleccionada:
      - **Si es igual**: Se des-selecciona.
      - **Si es diferente**: Se asigna como la categoría seleccionada.

4. **Propiedad `selected` en `_LayoutCard`**:
   - Se añadió una nueva propiedad al `_LayoutCard` para cambiar el color del texto dependiendo de si la categoría está seleccionada.

---

## Conclusión

Este capítulo demuestra cómo combinar múltiples criterios para filtrar dinámicamente una lista, proporcionando una experiencia de usuario interactiva y visualmente atractiva. En el próximo capítulo, exploraremos cómo añadir más interactividad y detalles visuales. ¡Sigue aprendiendo y desarrollando! 🚀
