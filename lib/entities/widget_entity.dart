// Clase WidgetEntity: representa la estructura de datos para cada widget.
// Esta clase encapsula las propiedades necesarias para un listile.
class WidgetEntity {

  String title;
  String subtitle;
  bool favorite;

  WidgetEntity({
    required this.title,
    required this.subtitle,
    required this.favorite,
  });

}

// Lista de widgets: simula datos que podrían provenir de una API o base de datos.
List<WidgetEntity> widgets = [
  WidgetEntity(
    title: "Material",
    subtitle: "Material Components",
    favorite: true
  ),
  WidgetEntity(
    title: "Expanded",
    subtitle: "Material Components",
    favorite: false
  ),
  WidgetEntity(
    title: "Card",
    subtitle: "Material Components",
    favorite: false
  ),
  WidgetEntity(
    title: "Divider",
    subtitle: "Material Components",
    favorite: true
  ),
  WidgetEntity(
    title: "ListTile",
    subtitle: "Material Components",
    favorite: true
  ),
  WidgetEntity(
    title: "AlertDialog",
    subtitle: "Material Components",
    favorite: false
  ),
];