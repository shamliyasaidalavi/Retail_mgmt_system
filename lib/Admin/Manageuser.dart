import 'package:flutter/material.dart';
import 'package:trip/Admin/model/usermodel.dart';
import 'package:trip/Admin/usermoredelails.dart';
import 'package:trip/Api/api_sevices.dart';


class Manageuser extends StatefulWidget {
  const Manageuser({Key? key}) : super(key: key);

  @override
  State<Manageuser> createState() => _ManageuserState();
}

class _ManageuserState extends State<Manageuser> {
  final List<String> containerImages = [
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
    'images/60111.jpg',
  ];
  List _loadprooducts = [];
  ApiService client = ApiService();
  final List<String> Name = ["Shamli", "Vincy", "sudhee", "vishu"];
  final List<String> Userid = ["3455", "5768", "478", "342"];

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
                "Users",
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
                      Expanded( // Wrap the Card widget with an Expanded widget
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name:${(snapshot.data![index].fname)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Userid:${(snapshot.data![index].id)}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios_outlined),
                        color: Colors.grey[600],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => More()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );

      }
      return Center(child: CircularProgressIndicator());
    } ),




          ],
        ),
      ),
    );
  }
}
