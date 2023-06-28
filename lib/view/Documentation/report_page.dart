
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';

import '../lists.dart';
import '../widgets/dropdown_nosearch.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: Icon(Icons.file_copy,size: 50,color: app_theam),
            ),
            NoSearchDropdown(
              items: block,
              onChanged: (value) {

              },
              selecteditem: 'ജില്ല',
            ),
            NoSearchDropdown(
              items: block,
              onChanged: (value) {},
              selecteditem: 'ജില്ല',
            ),
            NoSearchDropdown(
              items: panchayth,
              onChanged: (value) {},
              selecteditem: 'ജില്ല',
            ),
            NoSearchDropdown(
              items: block,
              onChanged: (value) {},
              selecteditem: 'ജില്ല',
            ),
            NoSearchDropdown(
              items: block,
              onChanged: (value) {

              },
              selecteditem: 'ജില്ല',
            ),

            ElevateClick(ontap: (){

            }, text:'Download')
           ],
          ),
        ),
      ),
    );
  }
}
