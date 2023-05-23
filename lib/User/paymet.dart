
import 'package:flutter/material.dart';



class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:
        Column(
          children: [

            Text("Payment Method", style: TextStyle(
                fontSize: 18
            ),),

            Divider(),

            RadioListTile(
              title: Text("Cash on delivery"),
              value: "Cash on delivery",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("PayUMoney"),
              value: "PayUMoney",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("RazorPay"),
              value: "RazorPay",
              groupValue: gender,
              onChanged: (value){
                setState(() {
                  gender = value.toString();
                });
              },
            ),

          Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
        color: Colors. blueAccent.withOpacity(0.8),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.grey.withOpacity(0.8), width: 5),
    ),
    child:
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    Center(
    child: Text(
    "Total Amount:Rs643.50",
    style: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 4.0),
    Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white),
    child: Center(
    child:  Text(
    "proceed",
    style: TextStyle(
    color: Colors.grey[900],
    fontWeight: FontWeight.bold),
    )),
    ),
          ],
        ),

      ),


    ),
    ),
    ),
      ]
      )
    ),
    );
  }
}
