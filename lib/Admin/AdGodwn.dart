import 'package:flutter/material.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Api/api_sevices.dart';

class Adgodwn extends StatefulWidget {
  const Adgodwn({Key? key}) : super(key: key);

  @override
  State<Adgodwn> createState() => _AdgodwnState();
}

class _AdgodwnState extends State<Adgodwn> {
  final List<String> containerImages = [
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> imageTitles = ["Godown1",];
  final List<String>Godowid = ["23456", "4566", "345", "345"];


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
    "Godown",
    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
    ),
    ),
    FutureBuilder<List<UserModel>>(
        future: client.fetchuser(),
    builder: (BuildContext context,
    AsyncSnapshot<List<UserModel>> snapshot) {
      if (snapshot.hasData) {
        return ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {

                    },
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
                                  Text(
                                    imageTitles[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text("Godowid${(snapshot.data![index].id)}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ]
                            ),


                          ]
                      ),
                    ),
                  ),
                )
            );
          },
        );
    }
      return Center(child: CircularProgressIndicator());
    }
    ),
      SizedBox(
        height: 20,),
      Center(
        child:

           ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            child: Text(
              'ADD',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
            ),
          ),
      ),
      ]
        ),
      ),

    );
  }
}
