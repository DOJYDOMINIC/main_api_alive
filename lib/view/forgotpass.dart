import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';


class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {



  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool obscureText = true;
  void toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  bool obscureTextone = true;
  void toggleVisibilityone() {
    setState(() {
      obscureTextone = !obscureTextone;
    });
  }

  Future<void> resetPassword() async {
    final String email = _emailController.text;
    final String newPassword = _newPasswordController.text;
    final String confirmPassword = _confirmPasswordController.text;



    if (newPassword != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Password Mismatch'),
            content: Text('New password and confirmation password do not match.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final url = Uri.parse('http://192.168.1.43:5000/api/auth/reset-password');

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': email,
      'newPassword': newPassword,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Password reset successful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Password reset successful.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to reset password. Error: ${response.statusCode}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
        title: Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _newPasswordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,color: Colors.black,
                  ),
                  onPressed: toggleVisibility,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: obscureTextone,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureTextone ? Icons.visibility : Icons.visibility_off,color: Colors.black,
                  ),
                  onPressed: toggleVisibilityone,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevateClick(
              ontap:  resetPassword,
              text:'Reset Password',
            ),
          ],
        ),
      ),
    );
  }
}
