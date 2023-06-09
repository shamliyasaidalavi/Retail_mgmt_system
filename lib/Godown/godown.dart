import 'package:flutter/material.dart';

import '../loginpage.dart';
import 'OrderDetails.dart';
import 'offerdetails.dart';

class godown extends StatefulWidget {
  const godown({Key? key}) : super(key: key);

  @override
  State<godown> createState() => _godownState();
}

class _godownState extends State<godown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },icon : Icon(Icons.menu),color: Colors.green,),

          title: Center(
            child: Text(
              "Godown",style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.green,)
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
        physics: ScrollPhysics(),
    child: SafeArea(
    child: Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
    children: <Widget>[
    Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    image: DecorationImage(
    image: AssetImage('images/one.jpg'),
    fit: BoxFit.cover)),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(13),
    gradient: LinearGradient(
    begin: Alignment.bottomRight,
    colors: [
    Colors.black.withOpacity(.4),
    Colors.black.withOpacity(.2),
    ])),
    )
    ),

      Padding(
        padding: const EdgeInsets.only(top:15,left: 20,right: 20),
        child: GestureDetector(onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => orderdetails()),
          );
        },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
            height: 100,
            width: double.infinity,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(" Order Details",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_sharp),

              ],
            ),

          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  offer()),
            );
          },
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("View Offer ",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_sharp),

              ],
            ),


          ),
        ),
      ),

    ],
    ),
    ),
    ),
    ),
    );
  }
}
