
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import '../screenone.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class CrpDetail extends StatefulWidget {
  const CrpDetail({Key? key}) : super(key: key);

  @override
  State<CrpDetail> createState() => _SalesState();
}

class _SalesState extends State<CrpDetail> {
  TextEditingController datacomments = TextEditingController();
  TextEditingController datanameofcrp = TextEditingController();
  TextEditingController dataNameofrespondent = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('സി.ആർ.പിയുടെ നിർദേശങ്ങൾ'),
        backgroundColor: app_theam,

      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(DocumentId),
            InputField(
                hint: 'CRP യുടെ പേര് ',
                controller: datanameofcrp,
                onchanged: (value) {

                }),
            InputField(
                hint: 'CRP യുടെ അഭിപ്രായങ്ങൾ രേഖപ്പെടുത്താം',
                controller: datacomments,
                onchanged: (value) {

                }),
            InputField(
                hint: 'വിവരം നൽകിയ വ്യക്തിയുടെ പേര് ',
                controller: dataNameofrespondent,
                onchanged: (value) {

                }),
            // ElevateClick(
            //     ontap: () {
            //       Crp();
            //     },
            //     text: 'Submit'),
            ElevateClick(
              ontap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Submit Data'),
                      content: Text('Are you sure you want to submit?'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Screenone(),));
                          },
                        ),
                        TextButton(
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              text: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
