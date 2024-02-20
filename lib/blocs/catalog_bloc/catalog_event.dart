abstract class CatalogEvent {}

class LoadCatalog extends CatalogEvent {}

class LoadCatalogByTitle extends CatalogEvent {
  String title;
  LoadCatalogByTitle({
    required this.title,
  });
}
