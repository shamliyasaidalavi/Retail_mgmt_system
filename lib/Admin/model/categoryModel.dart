class categoryModel {
  final String category;



  categoryModel({
    required this.category,


  });

  factory categoryModel.fromJson(Map<String, dynamic> json) {
    return categoryModel (

      category: json['category'],

    );
  }
}