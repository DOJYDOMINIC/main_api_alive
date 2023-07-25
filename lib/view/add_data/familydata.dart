
import 'package:flutter/material.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:provider/provider.dart';

import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../../global.dart';
import '../../model/model.dart';
import '../widgets/input_field.dart';
import 'livelihood.dart';


class FamilyData extends StatefulWidget {
  FamilyData({
    Key? key, this.id,
  }) : super(key: key);
final id;
  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {


  TextEditingController dataFamilydetailsNameoffailyfmember =
  TextEditingController();
  TextEditingController datafamilydetailsageoffamilymember =
  TextEditingController();
  TextEditingController datafamilydetailsrelation = TextEditingController();
  TextEditingController dataFamilydetailsEducation = TextEditingController();
  TextEditingController dataFamilydetailsRelation = TextEditingController();
  TextEditingController dataFamilydetailsSkill = TextEditingController();
  TextEditingController dataFamilydetailsJob = TextEditingController();


  // List<Member> familyMembers = [];
  void _addMember() {
    var providerone = Provider.of<TextMain>(context, listen: false);
    familyMembers.add(Member(
        dataFamilydetailsNameoffailyfmember: providerone.dataFamilydetailsNameoffailyfmember,
        dataFamilydetailsRelation: providerone.dataFamilydetailsRelation,
        dataFamilydetailsAgeoffamilymember: providerone.dataFamilydetailsAgeoffamilymember,
        dataFamilydetailsEducation: providerone.dataFamilydetailsEducation,
        dataFamilydetailsJob: providerone.dataFamilydetailsJob,
        dataFamilydetailsSkill: providerone.dataFamilydetailsSkill,
      ));

      // Clear text controllers
      dataFamilydetailsNameoffailyfmember.clear();
      datafamilydetailsrelation.clear();
      datafamilydetailsageoffamilymember.clear();
      dataFamilydetailsEducation.clear();
      dataFamilydetailsJob.clear();
      dataFamilydetailsSkill.clear();
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('കുടുംബവിവരം'),
          centerTitle: true,
          backgroundColor: app_theam,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  hint: 'കുടുംബാംഗത്തിൻ്റെ പേര്',
                  controller: dataFamilydetailsNameoffailyfmember,
                  onchanged: (value) {
                    // setState(() {
                    //   dataFamilydetailsNameoffailyfmember = value;
                    // });
                    providerone.updateDataFamilydetailsNameoffailyfmember(value);
                  },
                ),
                InputField(
                  hint: 'ബന്ധം',
                  controller: datafamilydetailsrelation,
                  onchanged: (value) {
                    providerone.updateDataFamilydetailsRelation(value);
                  },
                ),
                InputField(
                  hint: 'വയസ്സ്‌',
                  controller: datafamilydetailsageoffamilymember,
                  onchanged: (value) {
                    // setState(() {
                    //   datafamilydetailsageoffamilymember  = value;
                    // });
                    int? parsedValue = int.tryParse(value);
                    if (parsedValue != null) {
                      providerone.updateDatadataFamilydetailsAgeoffamilymember(parsedValue);
                    }
                  },
                  keytype: TextInputType.number,
                ),
                InputField(
                  hint: 'വിദ്യാഭ്യാസം',
                  controller: dataFamilydetailsEducation,
                  onchanged: (value) {
                    // setState(() {
                    //   dataFamilydetailsEducation = value;
                    // });
                    providerone.updateDataFamilydetailsEducation(value);
                  },
                ),
                InputField(
                  hint: 'തൊഴില്‍',
                  controller: dataFamilydetailsJob,
                  onchanged: (value) {
                    // setState(() {
                    //   dataFamilydetailsJob = value;
                    // });
                    providerone.updateDataFamilydetailsJob(value);
                  },
                ),
                InputField(
                  hint: 'പ്രത്യേക കഴിവ്',
                  controller: dataFamilydetailsSkill,
                  onchanged: (value) {
                    // setState(() {
                    //   dataFamilydetailsSkill = value;
                    // });
                    providerone.updateDataFamilydetailsSkill(value);
                  },
                ),

                // Display the list of family members
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: familyMembers.length,
                //   itemBuilder: (context, index) {
                //     var member = familyMembers[index];
                //     return ListTile(
                //       title: Text('name:${member.dataFamilydetailsNameoffailyfmember}'),
                //       subtitle: Text('relation : ${member.dataFamilydetailsRelation}'),
                //       trailing: Text('Age: ${member.dataFamilydetailsAgeoffamilymember}'),
                //     );
                //   },
                // ),

                GestureDetector(
                  onTap: (){
                    print(familyMembers);
                  },
                  child: ElevatedButton(
                      style: buttonstyle_main,
                    onPressed: _addMember,
                    child: Text('Add Member'),
                  ),
                ),
                ElevateClick(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LivelihoodValue(),));
                  },
                  text:'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
