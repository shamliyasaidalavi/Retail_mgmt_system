import 'package:flutter/material.dart';

class orderdetails extends StatefulWidget {
  const orderdetails({Key? key}) : super(key: key);

  @override
  State<orderdetails> createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  final List<String> imageTitles = ["Item name:tomato", "Item name:tomato", "Item name:tomato", "Item name:tomato"];
  final List<String> Titles = ["quantity:3", "quantity:3", "quantity:3", "quantity:3"];
  final List<String> Titless = ["Rate:983", "Rate:983", "Rate:9839", "Rate:983"];
  bool _isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
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

    Text("Order Details",
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
                      CircleAvatar(backgroundImage:AssetImage("images/two.jpg")



                        // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                      ),/*Container(
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
                          Text("${Titless[index]}"
                          ),  ],
                      ),
                      Icon(Icons.keyboard_arrow_down),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: _isExpanded ? 100 : 0, // Adjust the desired expanded height
                        child: _isExpanded
                            ? Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Perform action for the first expanded button
                              },
                              child: Text('yet to be delivered'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Perform action for the second expanded button
                              },
                              child: Text('Deliverd'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Perform action for the second expanded button
                              },
                              child: Text('sent'),
                            ),
                          ],
                        )
                            : null,
                      ),


                      Center(child: TextButton(onPressed:(){setState(() {
                        _isExpanded=!_isExpanded;
                      });

                      }, child: Column(
                        children: [


                        ],
                      ))),



                    ]),




              ),


            ),
          );
        },
      ),
]
    ),
    ),
    );
  }
}
