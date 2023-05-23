
import 'dart:async';

import 'package:trip/homepage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Splash())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(  padding: const EdgeInsets.all(8.0),
          child: Text(
            " lets order fresh item for you",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
        ),             Center(

            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/one.jpg"),fit: BoxFit.cover),
              ),
            ),
          ),

        ],
        ),

    );
  }
}