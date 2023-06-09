import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trip/Counter/Couter.dart';
import 'package:trip/Godown/godown.dart';
import 'package:trip/User/homepage2.dart';
import 'package:trip/User/mainscreen.dart';
import 'package:trip/delivery/M%20delivery.dart';
import 'package:trip/registration.dart';

class Login extends StatefulWidget {
  const  Login({Key? key}) : super(key: key);

  @override
  State< Login> createState() => _LoginState();
}

class _LoginState extends State< Login> {
  @override
  String user="user";
  String Counter="Counter";
  String Godown="Godown";
  String delivery="delivery";
  TextEditingController passcontroller=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.lightBlueAccent,
                      ),
                    ),
                    Text(
                      "Login With Your Credentials ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
                child: TextField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.lightBlueAccent
                      ),

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

                      labelText: "Enter username"



                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
                child: TextField(
                  controller: passcontroller,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.lightBlueAccent
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      labelText: " Enter password"

                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent, // Background color
                      ),
                      onPressed: (){
                    if(passcontroller.text== user){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>mainscreen()));
                      }
                    else if(passcontroller.text == Godown){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>godown()));

                    }
                    else if(passcontroller.text == delivery){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>Deliveryguy()));

                    }
                    else if(passcontroller.text == Counter){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>Couter1 ()));

                    }
                  }, child: Text("login"))
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    text: 'dont have an account?signup ',
                    style: TextStyle(fontSize: 18),
                    children: const <TextSpan>[
                      TextSpan(text: 'signup', style: TextStyle(fontWeight: FontWeight.bold),


                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
