class productModel {
  final String productname;
  final String category;
  final String quantity;


  productModel({required this.productname,
    required this.category,
    required this.quantity,

  });

  factory productModel.fromJson(Map<String, dynamic> json) {
    return productModel(
      quantity: json['quantity'],
      productname: json['product_name'],
      category: json['category'],

    );
  }
}