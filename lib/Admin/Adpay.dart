import 'package:flutter/material.dart';
import 'package:trip/Admin/model/paymentModel.dart';
import 'package:trip/Api/api_sevices.dart';

class admpaymt extends StatefulWidget {
  const admpaymt({Key? key}) : super(key: key);

  @override
  State<admpaymt> createState() => _admpaymtState();
}

class _admpaymtState extends State<admpaymt> {
  final List<String> containerImages = [
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> Billnumber= ["232445", "556", "4345", "45667"];
  final List<String> id = ["3445", "45466", "34590", "123489"];
  final List<String> Username = ["sudhee", "shamli", "vicy", "Aju"];
  final List<String> Amount = ["4567", "90800", "7869", "91054"];
  final List<String> Amounttype = ["OnlinePay", "Cash", "Card", "Cash"];
  final List<String> Date = ["On 07 May", "On 08 april", "On 09 May", "On 02 june"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_sharp, color: Colors.black),
          label: const Text('Back', style: TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Payment",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            FutureBuilder<List< paymentModel>>(
        future: client.fetchpayment(),
    builder: (BuildContext context,
    AsyncSnapshot<List<  paymentModel>> snapshot) {
      if (snapshot.hasData) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount:snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 2,
                child: InkWell(


                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(containerImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("bill_number: ${snapshot.data![index].Billnumber}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("user_id:${snapshot.data![index].id}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("user_name:${snapshot.data![index].Username}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("price:${snapshot.data![index].Amount}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text("Amounttype:${snapshot.data![index].Amounttype}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text("Date:${snapshot.data![index].Date}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            );
          },

        );

    }
      return Center(child: CircularProgressIndicator());
    }
            ),
          ],

        ),
      ),
    );
  }
}
