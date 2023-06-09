import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  final List<String> containerImages = [
    'images/two.jpg',
    'images/three.jpg',
    'images/two.jpg',
    'images/three.jpg',
  ];

  final List<String> username = ["shamli"];
  final List<String> userid = ["233"];
  final List<String> Gender = ["Female"];
  final List<String> phonenumber = ["9895780059"];
  final List<String> Address = ["magattil house"];
  final List<String> Email = ["shamli@gmail.com"];
  final List<String> Password = ["2334556@55"];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black),
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
          children: [
            Text(
              "",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40),
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                );
              },
              itemCount: username.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('images/profile.jpg'),
                              ),
                              Text(" ${username[index]}"),
                              Text(" ${phonenumber[index]}"),
                              Text(" ${Address[index]}"),
                              Text(" ${Email[index]}"),
                              Text(" ${Password[index]}"),
                              Text(" ${Gender[index]}"),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              // Delete button action
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Edit button action
                            },
                            icon: Icon(
                              Icons.edit,
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
          ],
        ),
      ),
    );
  }
}
