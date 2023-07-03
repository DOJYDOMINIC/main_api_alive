import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/search_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Documentation/report_page.dart';
import 'add_data/personal_add.dart';
import 'login.dart';

class Screenone extends StatefulWidget {
  const Screenone({Key? key}) : super(key: key);

  @override
  State<Screenone> createState() => _ScreenoneState();
}


class _ScreenoneState extends State<Screenone> {

  Future<void> clearAuthTokenFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    // print(clearAuthTokenFromPreferences());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Login(),));
                clearAuthTokenFromPreferences();
              },
              child: Row(
                children: [
                  Text('Exit'),
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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPage(),));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width*.8,
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
                            Icon(Icons.person,size: 75,color: Colors.white,),
                            Icon(Icons.add,size: 50,color: Colors.white,)
                          ],
                        ),
                        Text("ADD NEW",style: bold_white,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => SearchEdit(),));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width*.8,
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
                            Icon(Icons.person,size: 75,color: Colors.white,),
                            Icon(Icons.update,size: 50,color: Colors.white,)
                          ],
                        ),
                        Text("UPDATE",style: bold_white,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage(),));
                },
                child: SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width*.8,
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
                            Icon(Icons.person,size: 75,color: Colors.white,),
                            Icon(Icons.file_copy,size: 50,color: Colors.white,)
                          ],
                        ),
                        Text("DOCUMENTATION",style: bold_white,)
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
}
