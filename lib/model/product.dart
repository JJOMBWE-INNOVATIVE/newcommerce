
class Product {
  final String image;
  final String name;
  final double price;

  Product({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  String toString() {
    return 'Product(image: $image, name: $name, price: $price)';
  }

  static Product fromMap(Map<String, dynamic> data) {
    return Product(
      name: data['name'] as String,
      image: data['image'] as String,
      price: data['price'] as double,
    );
  }
}

