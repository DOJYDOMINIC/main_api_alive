import 'package:flutter/material.dart';
Color app_theam = Color.fromARGB(255, 38, 87, 66);
TextStyle bold_white = TextStyle(fontSize: 25,color: Colors.white);
TextStyle adj = TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold);

ButtonStyle buttonstyle_main = ElevatedButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 38, 87, 66), // Background color
);

String urls = 'http://192.168.1.44:5000/api' ;