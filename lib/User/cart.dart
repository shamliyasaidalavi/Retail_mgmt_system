import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Api/api.dart';

import 'package:trip/User/paymet.dart';

import '../Admin/model/productmodel.dart';
import 'placeorder.dart';

class Cart extends StatefulWidget {
   Cart({ this.product,Key? key}) : super(key: key);


  productModel ? product;

  @override
  State<Cart> createState() => _CartState();
}

final List<String> containerImages = [
  'images/two.jpg',
  'images/three.jpg',
  'images/two.jpg',
  'images/three.jpg',
];

int simpleIntInput = 1;
final List<String> imageTitles = ["Rice", "Meat", "Vegetables", "Fruits"];
final List<String> Titles = [
  "Rs100-2 items",
  "Rs512.10-1 item",
  "Rs50-4 items",
  "Rs60.20-3 items"
];
class _CartState extends State<Cart> {

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
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/two.jpg"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(imageTitles[index]),
                              Text(Titles[index]),
                            ],
                          ),
                          QuantityInput(
                            value: simpleIntInput,
                            onChanged: (value) => setState(
                                  () => simpleIntInput = int.parse(value.replaceAll(',', '')),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Implement delete item functionality
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Promo Code',
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Shipping'),
                          Text('Offer'),
                          Text('Sub Total'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('- \u{20B9} 100'),
                          Text('\u{20B9} 1,799'),
                          Text('\u{20B9} 8,200'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>placeorder()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "Place Order",
                      style: TextStyle(fontSize: 18),
                    ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
