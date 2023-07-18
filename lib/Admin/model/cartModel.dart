class CartModel {
  final String productname;
 // final String category;
  final String quantity;
  final String image;
  final String price;
  final String id;

  CartModel({
    required this.productname,
  //  required this.category,
    required this.quantity,
    required this.image,
    required this.price,
    required this.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productname: json['product_name'],
   //   category: json['category'],
      quantity: json['quantity'],
      image: json['product_image'],
      price: json['price'],
      id: json['_id'],
    );
  }
}
