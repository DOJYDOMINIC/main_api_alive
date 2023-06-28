
import 'package:flutter/material.dart';
import 'package:main200623/view/home_pag.dart';
import 'package:main200623/view/login.dart';
import 'package:main200623/view/registed%20people.dart';
import 'package:main200623/view/registration.dart';
import 'package:main200623/view/screenone.dart';
import 'package:provider/provider.dart';

import 'control/text_controller.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (context) => TextMain(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screenone()
      ),
    );
  }
}
