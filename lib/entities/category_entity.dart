// Clase CategoryEntity: representa la estructura de datos para cada categoría.
// Esta clase encapsula las propiedades necesarias para una tarjeta.
class CategoryEntity {
  String image; // URL de la imagen asociada a la categoría.
  String title; // Título de la categoría.
  String subtitle; // Subtítulo descriptivo de la categoría.

  // Constructor que requiere todas las propiedades para crear una instancia.
  CategoryEntity({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

// Lista de categorías: simula datos que podrían provenir de una API o base de datos.
List<CategoryEntity> categories = [

  CategoryEntity(
    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_1.png",
    title: "Material Components",
    subtitle: "10 Widgets",
  ),
  CategoryEntity(
    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_2.png",
    title: "Material Components",
    subtitle: "12 Widgets",
  ),
  CategoryEntity(
    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png",
    title: "Material Components",
    subtitle: "15 Widgets",
  ),
  CategoryEntity(
    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_4.png",
    title: "Material Components",
    subtitle: "7 Widgets",
  ),
  CategoryEntity(
    image: "https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_5.png",
    title: "Diálogos",
    subtitle: "4 Diálogos",
  ),

];