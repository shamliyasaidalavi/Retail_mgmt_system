class deliveryModel{
  final String delboyname;
  final String id;



  deliveryModel({required this.delboyname,
    required this.id,

  });

  factory deliveryModel.fromJson(Map<String, dynamic> json) {
    return deliveryModel(
      id: json['logid'],
      delboyname: json['delboyname'],
    );
  }
}