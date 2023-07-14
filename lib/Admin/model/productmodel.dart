class productModel {
  final String productname;
  final String category;
  final String quantity;
  final String price;
  final String description;
  final String id;


  productModel({required this.productname,
    required this.category,
    required this.quantity,
    required this.price,
    required this.description,
    required this.id,

  });

  factory productModel.fromJson(Map<String, dynamic> json) {
    return productModel(
      productname: json['product_name'],
      category: json['category'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
      id: json['_id'],

    );
  }
}