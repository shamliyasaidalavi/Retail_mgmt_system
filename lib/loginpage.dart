import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const  Login({Key? key}) : super(key: key);

  @override
  State< Login> createState() => _LoginState();
}

class _LoginState extends State< Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Welcome back Login With Your details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:Colors.black,



              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
            child: TextField(
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

                  labelText: "enter username"



              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
            child: TextField(
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: " enter password"

              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Container(
              width: 300,
              child: ElevatedButton(onPressed: (){}, child: Text("login"))
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              text: 'dont have an account?singup ',
              style: TextStyle(fontSize: 18),
              children: const <TextSpan>[
                TextSpan(text: 'singup', style: TextStyle(fontWeight: FontWeight.bold)),

              ],
            ),
          )
        ],
      ),
    );
  }
}
