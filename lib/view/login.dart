import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main200623/view/registed%20people.dart';
import 'dart:convert';
import 'package:main200623/view/registration.dart';
import 'package:main200623/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/color_text.dart';
import '../services/add_api.dart';
import 'forgotpass.dart';

String? authToken;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? dropdownValue;


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<String> dropdownOptions = ['Admin', 'User'];


  Future<void> saveAuthTokenToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', authToken!);
  }


  Future<void> login() async {

    String url = '${api}auth/login';

    Map<String, dynamic> body = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'roll' : dropdownValue,
    };

    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        saveAuthTokenToPreferences();
        // Successful login
        var data = json.decode(response.body);
        authToken = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('authToken', authToken!);
        prefs.setString('email', _emailController.text);



        // Process the data or navigate to the next screen
        _emailController.clear();
        _passwordController.clear();
        print(authToken);
        print(data);

        if(dropdownValue == 'Admin'){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredPeopleList(token : authToken),));
        }else if (dropdownValue == 'User'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screenone(),));
        }
      } else {
        // Login failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:  SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage('assets/alert.jpg'))),
              content: Text('Login Failed. Please try again.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: SizedBox(
                height: 100,
                width: 100,
                child: Image(image: AssetImage('assets/alert.jpg'))),
            content: Text('An error occurred. Please try again later.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightM = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [app_theam, Colors.black],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:heightM*.1),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/2023.jpg"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightM*.005),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [

                          SizedBox(height: heightM*.05),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  value: dropdownValue,
                                  decoration: InputDecoration(
                                    hintText: 'Role',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  items: dropdownOptions.map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                ),
                                Divider(color: Colors.grey),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(color: Colors.grey),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: app_theam,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage(),));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              child: Text(
                                'Register Here',
                                style: TextStyle(
                                  color:app_theam,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
