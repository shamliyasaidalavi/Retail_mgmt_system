import 'package:flutter/material.dart';

class offer extends StatefulWidget {
  const offer({Key? key}) : super(key: key);

  @override
  State<offer> createState() => _offerState();
}

class _offerState extends State<offer> {
  final List<String> _listText = [
    'Rice',
    'Meat',
  ];



  final List<String> _listItem = [
    'images/two.jpg',
    'images/three.jpg',
    'images/f.jpg',
    'images/five.jpg',
    'images/one.jpg',
    'images/two.jpg',
    'images/three.jpg',
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
          icon: const Icon(Icons.arrow_left_sharp,color: Colors.black,),
          label: const Text('Back',style: TextStyle(color:Colors.green )),
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
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    Text("Offers ",
    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
      GridView.builder(
        shrinkWrap: true,
        itemCount: _listItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 15),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(_listItem[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                _listText[index % _listText.length],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,

                ),
              ),

            ),
          );
        },
      ),
    ],
    )
    ),
    );

  }
}
