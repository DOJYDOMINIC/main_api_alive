
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/update_personal_add.dart';

class SerachresultUpsate extends StatelessWidget {
  const SerachresultUpsate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePersonalPage(),));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(Icons.person,size: 50,color: app_theam,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Name : {name}',style: adj,),
                          Text('Phone : {Phone}',style: adj,),
                          Text('Group : {NgName}',style: adj,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      },),
    );
  }
}
