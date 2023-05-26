import 'package:flutter/material.dart';

class Addoffers extends StatefulWidget {
  const Addoffers({Key? key}) : super(key: key);

  @override
  State<Addoffers> createState() => _AddoffersState();
}

class _AddoffersState extends State<Addoffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black,),
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
      child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Add Offers",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // Add padding around the search bar
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    // Use a Material design search bar
    child: TextField(
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.grey,
    border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    labelText: 'Tommato',
    ),
    )

    ),
    ),
        ]
    ),
      ),
    ),
    );
  }
}
