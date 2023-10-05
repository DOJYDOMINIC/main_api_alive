import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/control/text_controller.dart';
import 'package:main200623/view/registed%20people.dart';
import 'package:main200623/view/update/searchresult_update.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/add_api.dart';
import 'Documentation/report_page.dart';
import 'add_data/crpdreport.dart';
import 'add_data/personal_add.dart';
import 'login.dart';
import 'package:http/http.dart' as http;


class Screenone extends StatefulWidget {
  const Screenone({Key? key}) : super(key: key);

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  Future<void> clearAuthTokenFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // prefs.remove('authToken');
    // print(clearAuthTokenFromPreferences());
  }

  Future<void> syncDataWithServer() async {
    try {
      bool isConnected =
          await checkInternetConnectivity(); // Use your existing connectivity check function
      final box = Hive.box('data_box');
      List keys = box.keys.toList();

      if (isConnected) {
        for (int key in keys){
          final jsonData = box.get(key);
          await sendToServer(jsonData,key);
        }
        box.clear();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('lastIndex');
        setState(() {
        });
        // Remove the synced data from Hive
      } else {
        print('NO Data Avilable');
      }
    } catch (e) {
      print('no data to update $e');
    }
  }

  Future<void> sendToServer(String jsonData, int key) async {
    try {
      const url = '$api/user/insert'; // Replace with your API endpoint URL
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
        // Include the token in the headers
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );
      if (response.statusCode == 201) {

        var box = Hive.box('data_box');
        box.deleteAt(key);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Data Created successful!'),

          ),
        );
        // Data submitted successfully
        print('Data submitted successfully to the server.');
      } else {
        print(
            'Failed to submit data to the server. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while submitting data to the server: $error');
    }
  }

  String? name_;
  String? email_;
  String? roll_;

  Future<void> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String authToken = prefs.getString('authToken') ?? '';
    String email = prefs.getString('email') ?? '';
    String name = prefs.getString('name') ?? '';
    String district = prefs.getString('district') ?? '';
    String block = prefs.getString('block') ?? '';
    String panchayath = prefs.getString('panchayath') ?? '';
    String roll = prefs.getString('roll') ?? '';

    if (panchayath != null || panchayath.isNotEmpty) {
      setState(() {
        name_ = name;
        email_ = email;
        roll_ = roll;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Permission.notification.request();
    // requestPermissions();
    syncDataWithServer();
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Name: $name_'),
                    content: Text('Email: $email_'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),

                      // ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.info)),
        // IconButton(
        //     onPressed: () {
        //       var box = Hive.box('data_box');
        //       print(box.get(1));
        //       if (box.isEmpty) {
        //         showDialog(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               title: const Text('No Data Avilable'),
        //               content: const Text('No data to Update.'),
        //               actions: <Widget>[
        //                 TextButton(
        //                   child: const Text('OK'),
        //                   onPressed: () {
        //                     Navigator.of(context).pop();
        //                   },
        //                 ),
        //
        //                 // ),
        //               ],
        //             );
        //           },
        //         );
        //       } else {
        //         syncDataWithServer();
        //       }
        //     },
        //     icon: Icon(Icons.upload)),
        // backgroundColor: app_theam,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                clearAuthTokenFromPreferences();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Logout'),
                  SizedBox(width: 5),
                  Icon(Icons.exit_to_app),
                ],
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  providerone.clearData();
                  providerone.clearfamilydata();
                  syncDataWithServer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalPage(),
                      ));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Card(
                    elevation: 25,
                    shadowColor: Colors.black,
                    color: app_theam,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 75,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.add,
                              size: 50,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          "ADD NEW",
                          style: bold_white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  providerone.clearData();
                  providerone.clearfamilydata();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SerachresultUpsate(),
                      ));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Card(
                    elevation: 25,
                    shadowColor: Colors.black,
                    color: app_theam,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 75,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.update,
                              size: 50,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(
                          "UPDATE",
                          style: bold_white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(),
                      ));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Card(
                    elevation: 25,
                    shadowColor: Colors.black,
                    color: app_theam,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 75,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.file_copy,
                              size: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          "DOCUMENTATION",
                          style: bold_white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => HiveDataListPage(),
              //     ));
              //   },
              //   child: SizedBox(
              //     height: 150,
              //     width: MediaQuery.of(context).size.width * .8,
              //     child: Card(
              //       elevation: 25,
              //       shadowColor: Colors.black,
              //       color: app_theam,
              //       shape: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey),
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.person,
              //                 size: 75,
              //                 color: Colors.white,
              //               ),
              //               Icon(
              //                 Icons.file_copy,
              //                 size: 50,
              //                 color: Colors.white,
              //               ),
              //             ],
              //           ),
              //           Text(
              //             "OFFLINE DATA",
              //             style: bold_white,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              if (roll_ == 'Admin')
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: ElevateClick(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisteredPeopleList(),
                            ));
                      },
                      text: 'Registed Users'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
