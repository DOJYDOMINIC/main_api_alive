
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/update_product.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class UpdateLivelihood extends StatefulWidget {
  const UpdateLivelihood({Key? key,}) : super(key: key);

  @override
  State<UpdateLivelihood> createState() => _SalesState();
}

class _SalesState extends State<UpdateLivelihood> {

  TextEditingController datalivelihoodincomesource =
  TextEditingController();
  TextEditingController datalivelihoodnumbers =
  TextEditingController();
  TextEditingController datalivelihoodcapitalsource =
  TextEditingController();
  TextEditingController datalivelihoodrevenue =
  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: app_theam),
      body: Column(
        children: [
          // Text(DocumentId),
          InputField(hint: 'ഉപജീവന തൊഴിൽ', controller:datalivelihoodincomesource, onchanged: (value){}),
          InputField(hint: 'എണ്ണം‌', controller: datalivelihoodnumbers, onchanged: (value){}),
          InputField(hint: 'മൂലധന സ്രോതസ് (സ്വന്തം/പദ്ധതി) എഴുതുക', controller: datalivelihoodcapitalsource, onchanged: (value){}),
          InputField(hint: 'പ്രീതിമാസം വരുമാനം ', controller: datalivelihoodrevenue, onchanged: (value){}),
          ElevateClick(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(),));
              }, text:'Next'),
        ],
      ),
    );
  }
}
