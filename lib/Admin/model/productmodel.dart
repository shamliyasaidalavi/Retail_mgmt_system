class productModel {
  final String productname;
  final String category;
  final String quantity;
  final String id;


  productModel({required this.productname,
    required this.category,
    required this.quantity,
    required this.id,

  });

  factory productModel.fromJson(Map<String, dynamic> json) {
    return productModel(
      productname: json['product_name'],
      category: json['category'],
      quantity: json['quantity'],
      id: json['_id'],

    );
  }
}