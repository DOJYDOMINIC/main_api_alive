
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:provider/provider.dart';

import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'livelihood.dart';

class FamilyData extends StatefulWidget {
   FamilyData({Key? key,}) : super(key: key);

  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
  TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController();
TextEditingController datafamilydetailsageoffamilymember = TextEditingController();
TextEditingController datafamilydetailsrelation = TextEditingController();
TextEditingController dataFamilydetailsEducation = TextEditingController();
TextEditingController dataFamilydetailsRelation = TextEditingController();
TextEditingController dataFamilydetailsSkill = TextEditingController();
TextEditingController dataFamilydetailsJob = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(child: Text('$DocumentId')),
            InputField(hint: 'കുടുംബാംഗത്തിൻ്റെ പേര് ', controller:dataFamilydetailsNameoffailyfmember, onchanged: (value){
              providerone.updateDataFamilydetailsNameoffailyfmember(value);
            }),
            InputField(hint: 'ബന്ധം', controller: datafamilydetailsrelation, onchanged: (value){
              providerone.updateDataFamilydetailsRelation(value);
            }),
            InputField(hint: 'വയസ്സ്‌', controller:datafamilydetailsageoffamilymember, onchanged: (value){
    int? parsedValue = int.tryParse(value);
    if (parsedValue != null) {
    providerone.updateDatadataFamilydetailsAgeoffamilymember(parsedValue);
    }},keytype: TextInputType.number),
            InputField(hint: 'വിദ്യാഭ്യാസം', controller:dataFamilydetailsEducation, onchanged:(value){
              providerone.updateDataFamilydetailsEducation(value);
            }),
            InputField(hint: 'തൊഴില്‍', controller: dataFamilydetailsJob, onchanged: (value){
              providerone.updateDataFamilydetailsJob(value);
            }),
            InputField(hint: 'പ്രത്യേക കഴിവ്', controller: dataFamilydetailsSkill, onchanged: (value){
              providerone.updateDataFamilydetailsSkill(value);
            }),

            ElevateClick(ontap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LivelihoodValue(),));
            }, text:'Next')
          ],
        ),
      ),
    );
  }
}
