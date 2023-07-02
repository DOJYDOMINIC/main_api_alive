import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main200623/constant/color_text.dart';
import 'dart:convert';
import '../services/add_api.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _registerUser() async {
    final registrationData = {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    const apiUrl = "${api}auth/register";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),

        body: json.encode(registrationData),

        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 201) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Success"),
                content: Text("Registration successful!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
                ],
              );});
        // Registration successful, handle success response here
        print("Registration successful");
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      } else if (response.statusCode == 400) {
        // Registration failed, handle error response here
        print("User Exist");
      }else
        print("Registration failed");
      } catch (error) {
      // Error occurred during registration, handle error here
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
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
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                        SizedBox(height: 60),
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
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                              Divider(color: Colors.grey),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
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
                              Divider(color: Colors.grey),
                              TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: _registerUser,
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>Login(),));
                              style: ElevatedButton.styleFrom(
                                backgroundColor:app_theam,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: app_theam,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
