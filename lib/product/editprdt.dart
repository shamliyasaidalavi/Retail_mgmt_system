import 'package:flutter/material.dart';

class Prdtedit extends StatefulWidget {
  const Prdtedit({Key? key}) : super(key: key);

  @override
  State<Prdtedit> createState() => _PrdteditState();
}

class _PrdteditState extends State<Prdtedit> {
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
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Image.asset(
    'images/two.jpg',
    height: 200,
    fit: BoxFit.cover,
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // Add padding around the search bar
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // Use a Material design search bar
    child: TextField(
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    labelText: 'product name',
    ),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // Add padding around the search bar
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // Use a Material design search bar
    child: TextField(
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    labelText: 'product id',
    ),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // Add padding around the search bar
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // Use a Material design search bar
    child: TextField(
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    labelText: 'product quantity',
    ),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // Add padding around the search bar
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // Use a Material design search bar
    child: TextField(
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    labelText: 'product Description',
    ),
    ),
    ),
    ),

          const Spacer(), // Added to push buttons to the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your action here
                },
                child: Text(
                  'UPLOAD',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your action here
                },
                child: Text(
                  'DELETE',
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
            ],
          ),
          const SizedBox(height: 16), // Added for spacing
        ],
      ),
    ),
    );
  }
}
