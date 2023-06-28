
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'crpdreport.dart';
import 'livelihood.dart';

class SalesData extends StatefulWidget {
  const SalesData({Key? key,}) : super(key: key);

  @override
  State<SalesData> createState() => _SalesState();
}

class _SalesState extends State<SalesData> {

  TextEditingController dataSalesprdct2 =
  TextEditingController();
  TextEditingController dataSalesquntum2 =
  TextEditingController();
  TextEditingController dataSalessalesmethod =
  TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(backgroundColor: app_theam,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(DocumentId),
            InputField(hint: 'ഉല്‍പ്പന്നം', controller:dataSalesprdct2, onchanged: (value){
providerone.updateDataSalesprdct2(value);
            }),
            InputField(hint: 'അളവ്‌', controller: dataSalesquntum2, onchanged: (value){
              providerone.updateDataSalesquntum2(value);
            }),
            InputField(hint: 'വിപണന രീതി ', controller: dataSalessalesmethod, onchanged: (value){
              providerone.updateDataSalessalesmethod(value);
            }),
            ElevateClick(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CrpDetail(),));
            }, text:'Next'),
          ],
        ),
      ),
    );
  }
}
