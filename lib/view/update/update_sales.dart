
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'update_crpdreport.dart';
import 'update_livelihood.dart';

class UpdateSalesData extends StatefulWidget {
  const UpdateSalesData({Key? key,}) : super(key: key);

  @override
  State<UpdateSalesData> createState() => _SalesState();
}

class _SalesState extends State<UpdateSalesData> {

  TextEditingController dataSalesprdct2 =
  TextEditingController();
  TextEditingController dataSalesquntum2 =
  TextEditingController();
  TextEditingController dataSalessalesmethod =
  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('വിൽക്കുന്ന രീതി') ,
        centerTitle: true,
        backgroundColor: app_theam,),
      body: Column(
        children: [
          // Text(DocumentId),
          InputField(hint: 'ഉല്‍പ്പന്നം', controller:dataSalesprdct2, onchanged: (value){}),
          InputField(hint: 'അളവ്‌', controller: dataSalesquntum2, onchanged: (value){}),
          InputField(hint: 'വിപണന രീതി ', controller: dataSalessalesmethod, onchanged: (value){}),
          ElevateClick(
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCrpDetail(),));
          }, text:'Next'),
        ],
      ),
    );
  }
}
