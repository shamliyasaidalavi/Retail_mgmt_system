class cartModel {
  final String productname;
  final String category;
  final String quantity;
  final String image;
  final String id;



  cartModel({required this.productname,
    required this.category,
    required this.quantity,

    required this.image,

    required this.id,

  });

  factory cartModel.fromJson(Map<String, dynamic> json) {
    return cartModel(
      productname: json['product_name'],
      category: json['category'],
      quantity: json['quantity'],

      image: json['product_image'],
      id: json['_id'],

    );
  }
}