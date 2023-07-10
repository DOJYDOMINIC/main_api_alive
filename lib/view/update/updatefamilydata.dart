
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../widgets/input_field.dart';
import 'updatelivelihood.dart';

class Member {
  final String dataFamilydetailsNameoffailyfmember;
  final String dataFamilydetailsRelation;
  final int dataFamilydetailsAgeoffamilymember;
  final String dataFamilydetailsEducation;
  final String dataFamilydetailsJob;
  final String dataFamilydetailsSkill;

  Member({
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
  TextEditingController dataFamilydetailsNameoffailyfmember =
  TextEditingController();
  TextEditingController datafamilydetailsageoffamilymember =
  TextEditingController();
  TextEditingController datafamilydetailsrelation = TextEditingController();
  TextEditingController dataFamilydetailsEducation = TextEditingController();
  TextEditingController dataFamilydetailsRelation = TextEditingController();
  TextEditingController dataFamilydetailsSkill = TextEditingController();
  TextEditingController dataFamilydetailsJob = TextEditingController();

  List<Member> familyMembers = [];

  void _addMember() {
    setState(() {

      familyMembers.add(Member(
        dataFamilydetailsNameoffailyfmember: dataFamilydetailsNameoffailyfmember.text,
        dataFamilydetailsRelation: datafamilydetailsrelation.text,
        dataFamilydetailsAgeoffamilymember: int.tryParse(datafamilydetailsageoffamilymember.text) ?? 0,
        dataFamilydetailsEducation: dataFamilydetailsEducation.text,
        dataFamilydetailsJob: dataFamilydetailsJob.text,
        dataFamilydetailsSkill: dataFamilydetailsSkill.text,
      ));

      // Clear text controllers
      dataFamilydetailsNameoffailyfmember.clear();
      datafamilydetailsrelation.clear();
      datafamilydetailsageoffamilymember.clear();
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
                controller: datafamilydetailsageoffamilymember,
                onchanged: (value) {
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
                itemCount: familyMembers.length,
                itemBuilder: (context, index) {
                  var member = familyMembers[index];
                  return ListTile(
                    title: Text(member.dataFamilydetailsNameoffailyfmember),
                    subtitle: Text(member.dataFamilydetailsRelation),
                    trailing: Text('Age: ${member.dataFamilydetailsAgeoffamilymember}'),
                  );
                },
              ),

              ElevatedButton(
                onPressed: _addMember,

                child: Text('Add Member'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateLivelihoodValue(items: widget.items),));
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
