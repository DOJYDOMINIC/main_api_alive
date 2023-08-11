import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:main200623/view/widgets/headings_between.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../../global.dart';
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
  // List familylist  = [];

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     updatefamilyMembers=widget.items['familyDetails'];
  //   });
  //   getfamData();
  // }

  @override
  void initState() {
    super.initState();
    List<FamilyDetail> familyDetails = (widget.items['familyDetails'] as List)
        .map((dynamic item) => FamilyDetail.fromJson(item))
        .toList();

    setState(() {
      updatefamilyMembers = familyDetails;

    });
    getfamData();
  }


  // TextEditingController new_id = TextEditingController();
  // TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController();
  // TextEditingController dataFamilydetailsAgeoffamilymember =
  //     TextEditingController();
  // TextEditingController datafamilydetailsrelation = TextEditingController();
  // TextEditingController dataFamilydetailsEducation = TextEditingController();
  //
  // // TextEditingController dataFamilydetailsRelation = TextEditingController();
  // TextEditingController dataFamilydetailsSkill = TextEditingController();
  // TextEditingController dataFamilydetailsJob = TextEditingController();



  void _addMember() {
    var providerone = Provider.of<TextMain>(context,listen: false);
    setState(() {
      int ageOfFamilyMember = 0;
      List<FamilyDetail> updatefamilyMembers1 = [];



      updatefamilyMembers.add(
          // {
          //   "data_familydetails_nameoffailyfmember": '',
          //   "data_familydetails_ageoffamilymember" : '',
          // "data_familydetails_relation" : '',
          // "data_familydetails_education" : '',
          // "data_familydetails_skill" : '',
          // "data_familydetails_job" : '',
          // }
          FamilyDetail(
        dataFamilydetailsNameoffailyfmember: providerone.dataFamilydetailsNameoffailyfmember,
        dataFamilydetailsRelation:providerone.dataFamilydetailsRelation,
        dataFamilydetailsAgeoffamilymember: providerone.dataFamilydetailsAgeoffamilymember,
        dataFamilydetailsEducation: providerone.dataFamilydetailsEducation,
        dataFamilydetailsJob: providerone.dataFamilydetailsJob,
        dataFamilydetailsSkill: providerone.dataFamilydetailsSkill,
      )
      );



    });

    // providerone.clearfamilydata();
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
          actions: [
            IconButton(onPressed: (){
              return _addMember();
            }, icon:Icon(Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the list of family members
                Container(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: ListView.separated(
                    // shrinkWrap: true,
                    itemCount: updatefamilyMembers.length,
                    itemBuilder: (context, index) {
                      // var data = widget.items['familyDetails'][index];
                      var data = updatefamilyMembers[index];
                      TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController(text: data.dataFamilydetailsNameoffailyfmember??'');
                      TextEditingController dataFamilydetailsAgeoffamilymember = TextEditingController(text: data.dataFamilydetailsAgeoffamilymember.toString()??'0');
                      TextEditingController datafamilydetailsrelation = TextEditingController(text: data.dataFamilydetailsRelation??'');
                      TextEditingController dataFamilydetailsEducation = TextEditingController(text: data.dataFamilydetailsEducation??'');
                      TextEditingController dataFamilydetailsSkill = TextEditingController(text: data.dataFamilydetailsSkill??'');
                      TextEditingController dataFamilydetailsJob = TextEditingController(text: data.dataFamilydetailsJob??'');

                      // TextEditingController dataFamilydetailsNameoffailyfmember = TextEditingController(text: data["data_familydetails_nameoffailyfmember"]);
                      // TextEditingController dataFamilydetailsAgeoffamilymember = TextEditingController(text: data["data_familydetails_ageoffamilymember"].toString());
                      // TextEditingController datafamilydetailsrelation = TextEditingController(text: data["data_familydetails_relation"]);
                      // TextEditingController dataFamilydetailsEducation = TextEditingController(text: data["data_familydetails_education"]);
                      // TextEditingController dataFamilydetailsSkill = TextEditingController(text: data["data_familydetails_skill"]);
                      // TextEditingController dataFamilydetailsJob = TextEditingController(text: data["data_familydetails_job"]);



                      // TextEditingController new_id = TextEditingController(text: data["_id"]);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(new_id.text,style: TextStyle(color: Colors.white),),
                              Headings(text: "Member ${index+1}"),
                              InputField(
                                hint: 'കുടുംബാംഗത്തിൻ്റെ പേര്',
                                controller: dataFamilydetailsNameoffailyfmember,
                                onchanged: (value) {
                                  data.dataFamilydetailsNameoffailyfmember = dataFamilydetailsNameoffailyfmember.text;
                                  providerone
                                      .updateDataFamilydetailsNameoffailyfmember(data.dataFamilydetailsNameoffailyfmember);
                                  // setState(() {  });
                                },
                              ),
                              InputField(
                                hint: 'ബന്ധം',
                                controller: datafamilydetailsrelation,
                                onchanged: (value) {
                                  data.dataFamilydetailsRelation = datafamilydetailsrelation.text;
                                  providerone.updateDataFamilydetailsRelation(data.dataFamilydetailsRelation);
                                },
                              ),
                              InputField(
                                hint: 'വയസ്സ്‌',
                                controller: dataFamilydetailsAgeoffamilymember,
                                onchanged: (value) {
                                  data.dataFamilydetailsAgeoffamilymember = int.tryParse(dataFamilydetailsAgeoffamilymember.text);
                                  providerone
                                      .updateDatadataFamilydetailsAgeoffamilymember(data.dataFamilydetailsAgeoffamilymember);
                                },
                                keytype: TextInputType.number,
                              ),

                              InputField(
                                hint: 'വിദ്യാഭ്യാസം',
                                controller: dataFamilydetailsEducation,
                                onchanged: (value) {
                                  data.dataFamilydetailsEducation = dataFamilydetailsEducation.text;
                                  providerone.updateDataFamilydetailsEducation(data.dataFamilydetailsEducation);
                                },
                              ),
                              InputField(
                                hint: 'തൊഴില്‍',
                                controller: dataFamilydetailsJob,
                                onchanged: (value) {
                                  data.dataFamilydetailsJob = dataFamilydetailsJob.text;
                                  providerone.updateDataFamilydetailsJob(data.dataFamilydetailsJob);
                                },
                              ),
                              InputField(
                                hint: 'പ്രത്യേക കഴിവ്',
                                controller: dataFamilydetailsSkill,
                                onchanged: (value) {
                                  data.dataFamilydetailsSkill = dataFamilydetailsSkill.text;
                                  providerone.updateDataFamilydetailsSkill(data.dataFamilydetailsSkill);
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
                    }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 30,);
                  },
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     _addMember();
                //   },
                //   child: Text('Add Member'),
                // ),
                // ElevatedButton(
                //   onPressed: _addMember,
                //
                //   child: Text('Add Family Member'),
                // ),

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
