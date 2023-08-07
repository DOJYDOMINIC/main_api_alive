import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../../model/model.dart';
import '../widgets/input_field.dart';
import 'updatelivelihood.dart';

// class Member {
//   // final String new_id;
//   final String? dataFamilydetailsNameoffailyfmember;
//   final String? dataFamilydetailsRelation;
//   final int? dataFamilydetailsAgeoffamilymember;
//   final String? dataFamilydetailsEducation;
//   final String? dataFamilydetailsJob;
//   final String? dataFamilydetailsSkill;
//
//   Member({
//     // required this.new_id,
//      this.dataFamilydetailsNameoffailyfmember,
//      this.dataFamilydetailsRelation,
//      this.dataFamilydetailsAgeoffamilymember,
//      this.dataFamilydetailsEducation,
//      this.dataFamilydetailsJob,
//      this.dataFamilydetailsSkill,
//   });
// }

class UpdateFamilyData extends StatefulWidget {
  UpdateFamilyData({
    Key? key,
    this.items,
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

  // TextEditingController new_id = TextEditingController();
  TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController();
  TextEditingController dataFamilydetailsAgeoffamilymember =
      TextEditingController();
  TextEditingController datafamilydetailsrelation = TextEditingController();
  TextEditingController dataFamilydetailsEducation = TextEditingController();

  // TextEditingController dataFamilydetailsRelation = TextEditingController();
  TextEditingController dataFamilydetailsSkill = TextEditingController();
  TextEditingController dataFamilydetailsJob = TextEditingController();

  List<FamilyDetail> familyMembers = [];

  void _addMember() {
    setState(() {
      int ageOfFamilyMember = int.tryParse(dataFamilydetailsAgeoffamilymember.text) ?? 0;
      familyMembers.add(FamilyDetail(
        dataFamilydetailsNameoffailyfmember: dataFamilydetailsNameoffailyfmember.text,
        dataFamilydetailsRelation: datafamilydetailsrelation.text,
        dataFamilydetailsAgeoffamilymember: ageOfFamilyMember,
        dataFamilydetailsEducation: dataFamilydetailsEducation.text,
        dataFamilydetailsJob: dataFamilydetailsJob.text,
        dataFamilydetailsSkill: dataFamilydetailsSkill.text,
      ));
    });
  }





  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    int count = widget.items['familyDetails'].length;

    // Function to increment the count
    void incrementFamilyDetails() {
      setState(() {
       count++;

      });
    }

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
                // Display the list of family members
                Container(
                  height: 600,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: count,
                    itemBuilder: (context, index) {
                      var data = widget.items['familyDetails'][index];
                      TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController(text: data["data_familydetails_nameoffailyfmember"]);
                      TextEditingController dataFamilydetailsAgeoffamilymember = TextEditingController(text: data["data_familydetails_ageoffamilymember"].toString());
                      TextEditingController datafamilydetailsrelation = TextEditingController(text: data["data_familydetails_relation"]);
                      TextEditingController dataFamilydetailsEducation = TextEditingController(text: data["data_familydetails_education"]);
                      TextEditingController dataFamilydetailsSkill = TextEditingController(text: data["data_familydetails_skill"]);
                      TextEditingController dataFamilydetailsJob = TextEditingController(text: data["data_familydetails_job"]);
                      // TextEditingController new_id = TextEditingController(text: data["_id"]);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(new_id.text,style: TextStyle(color: Colors.white),),

                              InputField(
                                hint: 'കുടുംബാംഗത്തിൻ്റെ പേര്',
                                controller: dataFamilydetailsNameoffailyfmember,
                                onchanged: (value) {
                                  providerone
                                      .updateDataFamilydetailsNameoffailyfmember(
                                          value);
                                },
                              ),
                              InputField(
                                hint: 'ബന്ധം',
                                controller: datafamilydetailsrelation,
                                onchanged: (value) {
                                  providerone
                                      .updateDataFamilydetailsRelation(value);
                                },
                              ),
                              InputField(
                                hint: 'വയസ്സ്‌',
                                controller: dataFamilydetailsAgeoffamilymember,
                                onchanged: (value) {
                                  int? parsedValue = int.tryParse(value);
                                  providerone
                                      .updateDatadataFamilydetailsAgeoffamilymember(
                                          parsedValue);
                                },
                                keytype: TextInputType.number,
                              ),

                              InputField(
                                hint: 'വിദ്യാഭ്യാസം',
                                controller: dataFamilydetailsEducation,
                                onchanged: (value) {
                                  providerone
                                      .updateDataFamilydetailsEducation(value);
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
                              // ElevatedButton(
                              //   onPressed:(){
                              //     // print(widget.items['familyDetails'][5]);
                              //     _addMember();
                              //   },
                              //   child: Text('Add Member'),
                              // ),
                            ]),
                      );

                      ListTile(
                        title: Text(widget.items['familyDetails'][index]
                            ["data_familydetails_nameoffailyfmember"]),
                        // subtitle: Text(member.dataFamilydetailsRelation),
                        // trailing: Text('Age: ${member.dataFamilydetailsAgeoffamilymember}'),
                      );
                    },
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     _addMember();
                //   },
                //   child: Text('Add Member'),
                // ),
                ElevatedButton(
                  onPressed: _addMember,
                  child: Text('Add Family Member'),
                ),

                ElevateClick(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateLivelihoodValue(items: widget.items),
                        ));
                  },
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getfamData() {
    var dataup = widget.items['familyDetails'];
    setState(() {
      widget.items['familyDetails'];

      // dataFamilydetailsNameoffailyfmember.text  = dataup["data_familydetails_nameoffailyfmember"].toString();
      // datafamilydetailsrelation.text = dataup["data_familydetails_relation"].toString();
      // dataFamilydetailsSkill.text = dataup["data_familydetails_skill"].toString();
      // dataFamilydetailsEducation.text = dataup["data_familydetails_education"].toString();
      // dataFamilydetailsJob.text  = dataup["data_familydetails_job"].toString();
      // dataFamilydetailsAgeoffamilymember.text = dataup["data_familydetails_ageoffamilymember"].toString();
    });
  }
}
