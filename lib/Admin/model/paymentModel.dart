class paymentModel {
  final String Billnumber;
  final String id;
  final String Username;
  final String Amount;
  final String Amounttype;
  final String Date;


  paymentModel({
    required this. Billnumber,
    required this.id,
    required this.Username,
    required this.Amount,
    required this.Amounttype,
    required this.Date,

  });

  factory paymentModel.fromJson(Map<String, dynamic> json) {
    return paymentModel(
      Billnumber: json[' bill_number'],
      id: json['user_id'],
      Username: json['user_name'],
      Amount: json['price'],
      Amounttype: json['payment_type'],
      Date: json[' date'],

    );
  }
}