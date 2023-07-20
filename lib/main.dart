import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main200623/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'control/text_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextMain(),
        ),
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: SlpashScreen()),
    );
  }
}
