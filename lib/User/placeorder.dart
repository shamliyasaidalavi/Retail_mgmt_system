import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip/Admin/model/placeorderModel.dart';
import 'package:trip/Api/api.dart';

import 'paymet.dart';

class placeorder extends StatefulWidget {
  @override
  State<placeorder> createState() => _placeorderState();
}

class _placeorderState extends State<placeorder> {
  String user_name = '';
  String login_id = '';
  String product_name = '';
  String product_image = '';
  String quantity = '';
  String total = '';
  String id = '';
  String status = '';
  String user_id = '';
  late SharedPreferences prefs;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchplaceorder();
  }

  Future<List<placeorderModel>> fetchplaceorder() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print("uid${user_id}");
    var response =
        await Api().getData('/cart/myorder/' + user_id.replaceAll('"', ''));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("items${items}"));

      List<placeorderModel> products = List<placeorderModel>.from(
          items['data'].map((e) => placeorderModel.fromJson(e)).toList());
      return products;
    } else {
      List<placeorderModel> products = [];
      return products;
    }
  }

  final List<String> imageTitles = ["Rice", "Meat", "vegetables", "fruits"];
  final List<String> Titles = [
    "Rs100-2items",
    "Rs512.10-1item",
    "Rs50-4item",
    "Rs60.20-3item"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Overide the default Back button
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
          // other stuff
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("My order",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
          FutureBuilder<List<placeorderModel>>(
              future: fetchplaceorder(),
              builder: (BuildContext cfetchproductontext,
                  AsyncSnapshot<List<placeorderModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                      //   scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                        backgroundImage: AssetImage(
                                            "server/public/images/${snapshot.data![index].image}")

                                        // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                                        ),
                                    /*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                                    Column(
                                      children: [
                                        Text(snapshot.data![index].productname),
                                        Text(snapshot.data![index].total
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      });
                }
                return Center(child: CircularProgressIndicator());
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: (BorderRadius.circular(15))),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Total Amout"),
                            Text('\u{20B9} 10,019',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Text("Pay now"),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ),
            ),
          ),
        ])));
  }
}
