import 'package:flutter/material.dart';

import 'paymet.dart';
class placeorder extends StatefulWidget {
  const placeorder({Key? key}) : super(key: key);

  @override
  State<placeorder> createState() => _placeorderState();
}

class _placeorderState extends State<placeorder> {
  final List<String> imageTitles = ["Rice", "Meat", "vegetables", "fruits"];
  final List<String> Titles = ["Rs100-2items", "Rs512.10-1item", "Rs50-4item", "Rs60.20-3item"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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

    Text("My order",
    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),
    ListView.separated(
    shrinkWrap: true,
    separatorBuilder: (context, index) {
    return SizedBox(
    width: 20,
    );
    },
    //   scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(backgroundImage: AssetImage("images/two.jpg")


                    // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                  ), /*Container(
                                  width: 80,
                                  child: Image.asset(containerImages[index],
                                      fit: BoxFit.cover),
                                ),*/

                  Column(
                    children: [
                      Text("${imageTitles[index]}"
                      ),
                      Text("${Titles[index]}"
                      ),
                    ],
                  ),


                ],
              ),

            ),)
      );
    }
    ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: (BorderRadius.circular(15))
              ),
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
                                  style: TextStyle(fontSize: 20,  color: Colors.white,)),
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

    ]

    )

    )

    );



  }
}
