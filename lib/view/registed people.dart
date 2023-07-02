import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main200623/view/screenone.dart';
import 'dart:convert';

import '../constant/color_text.dart';
import '../services/add_api.dart';

class RegisteredPeopleList extends StatefulWidget {
  const RegisteredPeopleList({Key? key}) : super(key: key);

  @override
  State<RegisteredPeopleList> createState() => _RegisteredPeopleListState();
}

class _RegisteredPeopleListState extends State<RegisteredPeopleList> {
  List<User> registeredPeople = [];
  final userId = '64916f204baa91202ec7d31e';


  @override
  void initState() {
    super.initState();
    fetchRegisteredPeople();
  }

  Future<void> deleteDataById(String dataId) async {
    final apiUrl = '${api}auth/deleteUsers/$dataId';
print(dataId);
    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 201) {
        print('Data deletion successful');
      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred during data deletion: $error');
    }
  }

  Future<void> updateUser(String userId) async {
    final apiUrl = '${api}auth/validUser/$userId';
    print(userId);

    try {
      final response = await http.put(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print('User update successful');
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred during user update: $error');
    }
  }


  Future<void> fetchRegisteredPeople() async {
    String url = '${api}auth/registerUser';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = registedlistFromJson(response.body);
        setState(() {
          registeredPeople = data.users;
        });
        
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to fetch registered people list.'),
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
            title: Text('Error'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered People'),
        backgroundColor: app_theam,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Screenone(),));
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: registeredPeople.length,
          itemBuilder: (BuildContext context, int index) {
            var person = registeredPeople[index];
            return Container(
              child: GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Submit Data'),
                        content: Text('Are you sure you want to submit?'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              setState(() {
                                updateUser(person.id);
                                fetchRegisteredPeople();
                              });
                                Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Back'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },

                child: ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.email),
                  trailing: IconButton(
                    onPressed: (){
                      setState(() {
                        deleteDataById(person.id);
                        fetchRegisteredPeople();
                      });
                    }, icon: Icon(Icons.delete,color: Colors.red,),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Registedlist registedlistFromJson(String str) =>
    Registedlist.fromJson(json.decode(str));

String registedlistToJson(Registedlist data) => json.encode(data.toJson());

class Registedlist {
  List<User> users;

  Registedlist({
    required this.users,
  });

  factory Registedlist.fromJson(Map<String, dynamic> json) => Registedlist(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  String id;
  String name;
  String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
  };
}