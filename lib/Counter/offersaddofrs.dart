import 'package:flutter/material.dart';

class Addoffers extends StatefulWidget {
  const Addoffers({Key? key}) : super(key: key);
  @override
  State<Addoffers> createState() => _AddoffersState();
}
final List<String> drp = <String>['5%', '8%', '10%', '20%','50%'];
final List<String> offertypes = <String>['Buy 1 get 1', 'Dicount Sales', 'Gifts', 'Extra'];

class _AddoffersState extends State<Addoffers> {
  String dropdownValue = drp.first;
  String dropdownValue2 = offertypes.first;
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
      child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Add Offers",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
    Divider(),


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
    labelText: 'Category/Item name',
    ),
    ),
    ),
    ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: dropdownValue2,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),


                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue2 = value!;
                  });
                },
                items: offertypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                    labelText: 'Offer Value',
                  ),
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black),


            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: drp.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

            Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Add Offer"),
                ),
                onPressed: () {},

              ),
            ),
        ],
    ),
      ),
    ),
    );
  }
}
