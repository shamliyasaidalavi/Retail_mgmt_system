
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}
final List<String> containerImages = [
'images/two.jpg',
'images/three.jpg',
'images/two.jpg',
'images/three.jpg',
];
final List<String> imageTitles = ["Rice", "Meat", "vegetables", "fruits"];
final List<String> Titles = ["Rs100-2items", "Rs512.10-1item", "Rs50-4item", "Rs60.20-3item"];

class _CartState extends State<Cart> {
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

         Text("My Cart",
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.edit,color: Colors.blue,),
                                    Text("Edit",style: TextStyle(color: Colors.blue),)
                                  ],
                                ),

                              ]),
                        ),

                      ),
                    );
                  },
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  color: Colors.grey.withOpacity(0.8),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.withOpacity(0.8), width: 5),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Center(
                            child: Text(
                              "Repeat Previous Order",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child:  Text(
                              "Order Now",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 30,)


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Promo Code',
                        )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Shipping'),
                              Text('Offer'),
                              Text('Tax'),
                              Text('Sub Total'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('  \u{20B9} 80'),
                              Text('- \u{20B9} 100'),
                              Text('  \u{20B9} 1,799'),
                              Text('  \u{20B9} 8,200')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                          onPressed: () {},

                        ),
                      ))),
            ],
        ),
      ),
    );
  }





  }

