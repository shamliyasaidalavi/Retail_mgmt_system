import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon : Icon(Icons.menu),color: Colors.green,),
        title: Center(
          child: Text(
            "Counter",style: TextStyle(color: Colors.blueGrey),
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
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('images/one.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ])),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
                    height: 90,
                    width: double.infinity,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(" Add offers",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),

                      ],
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Today sales ",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),

                      ],
                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("payment status ",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),

                      ],
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
