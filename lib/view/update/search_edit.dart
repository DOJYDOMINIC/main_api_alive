

import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/searchresult_update.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import '../lists.dart';
import '../widgets/dropdown_container_model.dart';
import '../widgets/dropdown_nosearch.dart';


class SearchEdit extends StatelessWidget {
  const SearchEdit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person,color: app_theam,size: 50,),
        Icon(Icons.search,color: app_theam,size: 50,)
      ],
    ),
    SizedBox(height: 30,),
    NoSearchDropdown(
        items: block,
        onChanged: (value) {},
        selecteditem: 'ജില്ല',
    ),
    DropdownContainerModel(
        onChanged: (value) {},
        hint: 'ബ്ലോക്ക്',
        items: block,
    ),
    DropdownContainerModel(
          onChanged: (value) {}, items: panchayth, hint: 'പഞ്ചായത്ത്'),
    NoSearchDropdown(
        items: block,
        onChanged: (value) {},
        selecteditem: 'CRP',
    ),
   ElevateClick(ontap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SerachresultUpsate(),));
    }, text:'Search'),
  ],
),
      ),
    );
  }
}
