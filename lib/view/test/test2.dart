import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Member {
  final String name;
  final int age;

  Member(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {
      'data_familydetails_nameoffailyfmember': name,
      'data_familydetails_ageoffamilymember': age,
    };
  }
}



class FamilyData extends StatefulWidget {
  FamilyData({Key? key}) : super(key: key);

  @override
  _FamilyDataState createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
  List<Member> familyMembers = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void addFamilyMember() {
    final String name = nameController.text;
    final int age = int.tryParse(ageController.text) ?? 0;

    if (name.isNotEmpty && age > 0) {
      setState(() {
        familyMembers.add(Member(name, age));
      });
      nameController.clear();
      ageController.clear();
    }
  }

  Future<void> submitData() async {
    // Replace "YOUR_NODEJS_SERVER_URL" with your actual Node.js server URL
    final url = Uri.parse('YOUR_NODEJS_SERVER_URL');
    final List<Map<String, dynamic>> jsonData =
    familyMembers.map((member) => member.toJson()).toList();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'members': jsonData}),
      );

      if (response.statusCode == 201) {
        // Successfully submitted data to the server
        print('Data submitted successfully.');
      } else {
        // Handle error if the response status code is not 201
        print('Failed to submit data to the server.');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the HTTP request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Members'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addFamilyMember,
              child: Text('Add Member'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Submit Data to Server'),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: familyMembers.length,
              itemBuilder: (context, index) {
                var member = familyMembers[index];
                return ListTile(
                  title: Text(member.name),
                  subtitle: Text('Age: ${member.age}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
