class Item {
  final String name;
  final double price;
  final String imagePath;
  int quantity;

  Item({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 0,
  });
}
