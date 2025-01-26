# Capítulo 10: Uso de Entidades y Simulación de Datos

## Objetivo

En este capítulo, aprenderás a crear una **entidad** (clase `CategoryEntity`) para estructurar y organizar datos de manera profesional, simulando cómo se manejan los datos en aplicaciones reales. Además, se optimizó el código utilizando una lista de instancias de esta entidad y el método `List.generate` para renderizar las tarjetas dinámicamente.

---

## Desarrollo

1. Se creó la clase `CategoryEntity` para representar una categoría con las propiedades necesarias (`image`, `title`, `subtitle`).
2. Se definió una lista estática de objetos `CategoryEntity` para simular datos obtenidos en tiempo de ejecución, como en una API o base de datos.
3. Se utilizó `List.generate` para recorrer la lista de categorías y generar dinámicamente las tarjetas con el widget `_LayoutCard`.
4. Este enfoque mejora la legibilidad del código, facilita la escalabilidad y se aproxima a cómo se manejan los datos en aplicaciones reales.

---

## Conclusión

La creación de entidades y el uso de listas de instancias permiten estructurar mejor los datos y optimizar el manejo dinámico de contenido en aplicaciones Flutter. Este enfoque simula un entorno más cercano al de aplicaciones reales y es esencial para manejar datos provenientes de APIs, bases de datos u otros servicios.

En el siguiente capítulo, exploraremos más Widgets. ¡Sigue aprendiendo y avanzando! 🚀

---
