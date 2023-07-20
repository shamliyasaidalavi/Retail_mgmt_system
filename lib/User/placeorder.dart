/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/placeorderModel.dart';
import 'package:trip/Api/api.dart';

import 'paymet.dart';

class placeorder extends StatefulWidget {
  @override
  final String user_id;
  placeorder({required this.user_id});
  State<placeorder> createState() => _placeorderState();
}

class _placeorderState extends State<placeorder> {
  List<Map<String, dynamic>> cars = [];
  String dx = '';

  @override
  void initState() {
    super.initState();
    print("uisettttttd${widget.user_id}");
  }

  Future<List<Map<String, dynamic>>> _viewPro() async {
    try {
      dx = widget.user_id.replaceAll('"', '');
      print("User ID: ${dx}");
      var res = await Api().getData('/cart/view_order/' + dx);
      print("API Response Body: ${res.body}");
      var body = json.decode(res.body);

      if (body.containsKey('data')) {
        print('success');
        return (body['data'] as List<dynamic>).cast<Map<String, dynamic>>();
      } else {
        print("No 'data' key found in the response.");
        return []; // Return an empty list if 'data' key is not present in the response
      }
    } catch (e) {
      print("Error fetching data: $e");
      return []; // Return an empty list if there's an error
    }
  }

  // Add a helper function to build the ListView
  Widget _buildListView() {
    if (cars.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      print('success111');
      return ListView.builder(
        shrinkWrap: true,
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          String product_id = car['product_id'] ?? '';
          String product_name = car['product_name'] ?? '';
          String product_image = car['product_image'] ?? '';
          String user_id = car['user_id'] ?? '';
          String total = car['total'].toString();
          String totalamt = car['total_amount'].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "server/public/images/${product_image}",
                      ),
                    ),
                    Column(
                      children: [
                        Text('$product_name'),
                        Text(''),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: ElevatedButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Total Amount"),
                                          Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("Pay now"),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.black,
          ),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
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
            Text("My order", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
            // Use FutureBuilder to handle async data loading and display the ListView
            FutureBuilder(
              future: _viewPro(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  cars = snapshot.data as List<Map<String, dynamic>>;
                  return _buildListView();
                }
              },
            ),
          ],
      ),
    ));
  }
}
*/
