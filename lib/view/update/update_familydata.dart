
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'update_livelihood.dart';

class UpdateFamilyData extends StatefulWidget {
   UpdateFamilyData({Key? key,}) : super(key: key);

  @override
  State<UpdateFamilyData> createState() => _UpdateFamilyDataState();
}

class _UpdateFamilyDataState extends State<UpdateFamilyData> {
  TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController();
TextEditingController datafamilydetailsageoffamilymember = TextEditingController();
TextEditingController datafamilydetailsrelation = TextEditingController();
TextEditingController dataFamilydetailsEducation = TextEditingController();
TextEditingController dataFamilydetailsRelation = TextEditingController();
TextEditingController dataFamilydetailsSkill = TextEditingController();
TextEditingController dataFamilydetailsJob = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('കുടുംബവിവരം') ,
        centerTitle: true,
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: Text('$DocumentId')),
            InputField(hint: 'കുടുംബാംഗത്തിൻ്റെ പേര് ', controller:dataFamilydetailsNameoffailyfmember, onchanged: (value){}),
            InputField(hint: 'ബന്ധം', controller: datafamilydetailsrelation, onchanged: (value){}),
            InputField(hint: 'വയസ്സ്‌', controller:datafamilydetailsageoffamilymember, onchanged: (value){},keytype: TextInputType.number,),
            InputField(hint: 'വിദ്യാഭ്യാസം', controller:dataFamilydetailsEducation, onchanged:(value){}),
            InputField(hint: 'തൊഴില്‍', controller: dataFamilydetailsJob, onchanged: (value){}),
            InputField(hint: 'പ്രത്യേക കഴിവ്', controller: dataFamilydetailsSkill, onchanged: (value){}),
            ElevateClick(ontap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateLivelihood(),));
            }, text:'Next')
          ],
        ),
      ),
    );
  }
}
