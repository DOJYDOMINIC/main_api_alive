import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login.dart';


class SlpashScreen extends StatefulWidget {
  const SlpashScreen({Key? key}) : super(key: key);

  @override
  State<SlpashScreen> createState() => _SlpashScreenState();
}

class _SlpashScreenState extends State<SlpashScreen> {

  var email = '';
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Center(child: Image(image: AssetImage('assets/logo.png'))),
      nextScreen: email == null || email == '' ? Login() : Screenone(),
      duration:1500,
      splashIconSize: 200,
    );
  }

  void getData() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        email = prefs.getString('email')??'';
        authToken =  prefs.getString('authToken');
      });
    } catch(e){
      print( 'get Data email : $e');
    }


  }
}