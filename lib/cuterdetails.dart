import 'package:flutter/material.dart';

class ctrdetails extends StatefulWidget {
  const ctrdetails({Key? key}) : super(key: key);

  @override
  State<ctrdetails> createState() => _ctrdetailsState();
}

class _ctrdetailsState extends State<ctrdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.black),
          label: const Text(
            'Back',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      Column(
        children: [
          Container(
            child:
            Align(alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("images/profile.png"),
                      ),
                  ),

                ],


              ),
            ),
          ),
          Text(
            'Counter name:',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 19),
          ),
          Text(
            'Counter id:',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 19),
          ),
        ],

      ),


          );
  }
}
