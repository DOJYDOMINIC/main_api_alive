
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../widgets/input_field.dart';
import 'updatelivelihood.dart';

class Member {
  final String new_id;
  final String dataFamilydetailsNameoffailyfmember;
  final String dataFamilydetailsRelation;
  final int dataFamilydetailsAgeoffamilymember;
  final String dataFamilydetailsEducation;
  final String dataFamilydetailsJob;
  final String dataFamilydetailsSkill;

  Member( {
    required this.new_id,
    required this.dataFamilydetailsNameoffailyfmember,
    required this.dataFamilydetailsRelation,
    required this.dataFamilydetailsAgeoffamilymember,
    required this.dataFamilydetailsEducation,
    required this.dataFamilydetailsJob,
    required this.dataFamilydetailsSkill,
  });
}

class UpdateFamilyData extends StatefulWidget {
  UpdateFamilyData({
    Key? key, this.items,
  }) : super(key: key);
  final items;

  @override
  State<UpdateFamilyData> createState() => _UpdateFamilyDataState();
}



class _UpdateFamilyDataState extends State<UpdateFamilyData> {

 @override
  void initState() {
    super.initState();
    getfamData();
  }

  TextEditingController new_id = TextEditingController();
  TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController();
  TextEditingController dataFamilydetailsAgeoffamilymember = TextEditingController();
  TextEditingController datafamilydetailsrelation = TextEditingController();
  TextEditingController dataFamilydetailsEducation = TextEditingController();
  TextEditingController dataFamilydetailsRelation = TextEditingController();
  TextEditingController dataFamilydetailsSkill = TextEditingController();
  TextEditingController dataFamilydetailsJob = TextEditingController();

  List<Member> familyMembers = [];


  void _addMember() {
    setState(() {
      int ageOfFamilyMember = int.tryParse(dataFamilydetailsAgeoffamilymember.text) ?? 0;

      familyMembers.add(Member(
        dataFamilydetailsNameoffailyfmember: dataFamilydetailsNameoffailyfmember.text,
        dataFamilydetailsRelation: datafamilydetailsrelation.text,
        dataFamilydetailsAgeoffamilymember: ageOfFamilyMember,
        dataFamilydetailsEducation: dataFamilydetailsEducation.text,
        dataFamilydetailsJob: dataFamilydetailsJob.text,
        dataFamilydetailsSkill: dataFamilydetailsSkill.text,
        new_id: new_id.text,
      ));

      // Clear text controllers
      new_id.clear();
      dataFamilydetailsNameoffailyfmember.clear();
      datafamilydetailsrelation.clear();
      dataFamilydetailsAgeoffamilymember.clear();
      dataFamilydetailsEducation.clear();
      dataFamilydetailsJob.clear();
      dataFamilydetailsSkill.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
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
                  controller: dataFamilydetailsAgeoffamilymember,
                  onchanged: (value) {
                    int? parsedValue = int.tryParse(value);
                    providerone.updateDatadataFamilydetailsAgeoffamilymember(parsedValue);
                  },
                  keytype: TextInputType.number,
                ),

                InputField(
                  hint: 'വിദ്യാഭ്യാസം',
                  controller: dataFamilydetailsEducation,
                  onchanged: (value) {
                    providerone.updateDataFamilydetailsEducation(value);
                  },
                ),
                InputField(
                  hint: 'തൊഴില്‍',
                  controller: dataFamilydetailsJob,
                  onchanged: (value) {
                    providerone.updateDataFamilydetailsJob(value);
                  },
                ),
                InputField(
                  hint: 'പ്രത്യേക കഴിവ്',
                  controller: dataFamilydetailsSkill,
                  onchanged: (value) {
                    providerone.updateDataFamilydetailsSkill(value);
                  },
                ),
                // Display the list of family members
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:  widget.items['familyDetails'].length,
                  itemBuilder: (context, index) {
                    TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController(text:widget.items['familyDetails'][index]["data_familydetails_nameoffailyfmember"] );

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      InputField(
                      hint: 'കുടുംബാംഗത്തിൻ്റെ പേര്',
                      controller: dataFamilydetailsNameoffailyfmember,
                      onchanged: (value) {
                        providerone.updateDataFamilydetailsNameoffailyfmember(value);
                      },
                    ),]);


                      ListTile(
                      title: Text(widget.items['familyDetails'][index]["data_familydetails_nameoffailyfmember"]),
                      // subtitle: Text(member.dataFamilydetailsRelation),
                      // trailing: Text('Age: ${member.dataFamilydetailsAgeoffamilymember}'),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed:(){
                    print(widget.items['familyDetails'][5]);
                  },
                  // _addMember(),
                  child: Text('Add Member'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateLivelihoodValue(items: widget.items),));
                  },
                  child: Text('Next'),
                ),
              ],
            ),
        ),
      ),
    );
  }

  void getfamData() {
    var dataup = widget.items['familyDetails'];
    setState(() {
      widget.items['familyDetails'];
      // new_id.text = dataup['_id'].toString();
      // dataFamilydetailsNameoffailyfmember.text  = dataup["data_familydetails_nameoffailyfmember"].toString();
      // datafamilydetailsrelation.text = dataup["data_familydetails_relation"].toString();
      // dataFamilydetailsSkill.text = dataup["data_familydetails_skill"].toString();
      // dataFamilydetailsEducation.text = dataup["data_familydetails_education"].toString();
      // dataFamilydetailsJob.text  = dataup["data_familydetails_job"].toString();
      // dataFamilydetailsAgeoffamilymember.text = dataup["data_familydetails_ageoffamilymember"].toString();
    });
  }
}


