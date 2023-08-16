import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/control/text_controller.dart';
import 'package:main200623/view/update/search_edit.dart';
import 'package:permission_handler/permission_handler.dart';
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
    bool isConnected = await checkInternetConnectivity(); // Use your existing connectivity check function
    if (isConnected) {
      final box = Hive.box('data_box');
      for (var key in box.keys) {
        final jsonData = box.get(key);
        await sendToServer(jsonData);
        print(jsonData); // Send data to the server using your existing logic
        box.delete(key); // Remove the synced data from Hive
      }
    }
  }

  Future<void> sendToServer(String jsonData) async {
    const url = '$api/user/insert'; // Replace with your API endpoint URL
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken', // Include the token in the headers
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Text('Data Created successful!'),
          ),
        );
        // Data submitted successfully
        print('Data submitted successfully to the server.');
      } else {
        print('Failed to submit data to the server. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while submitting data to the server: $error');
    }
  }


  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        syncDataWithServer();
      }
    });
    // Permission.notification.request();
    // requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title:Text('name:${''}'),
        //         content:Text('Email:${''}'),
        //         actions: [
        //           TextButton(
        //             child: Text('OK'),
        //             onPressed: () {
        //               Navigator.of(context).pop();
        //             },
        //           ),
        //         ],
        //       );
        //     },
        //   );
        // }, icon: Icon(Icons.info)),
        backgroundColor: app_theam,
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
                        builder: (context) => SearchEdit(),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportPage(),
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
                            )
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
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> requestPermissions() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //     Permission.notification,
  //     Permission.manageExternalStorage,
  //     Permission.mediaLibrary,
  //   ].request();
  //
  //   // Check the status of each permission
  //   statuses.forEach((permission, status) {
  //     if (status.isGranted) {
  //       print('${permission.toString()} is granted.');
  //     } else if (status.isDenied) {
  //       print('${permission.toString()} is denied.');
  //     } else if (status.isPermanentlyDenied) {
  //       print('${permission.toString()} is permanently denied.');
  //     }
  //   });
  // }
}
