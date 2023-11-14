

class CartModel{

final String? name;
final String? image;
final double? price;
 int? quantity;

CartModel({this.image,this.name,this.price,this.quantity});

  get color => null;

  get size => null;

@override
  String toString() {
    return 'Product(image: $image, name: $name, price: $price,quantity:$quantity)';
  }
   
   
   
 void saveQuantity(int quantity) {
    this.quantity = quantity;
  }
}