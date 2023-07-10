
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/color_text.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';
import 'updatecrpdreport.dart';

class UpdateSalesData extends StatefulWidget {
  const UpdateSalesData({Key? key, this.items,}) : super(key: key);

  final items;

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
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('വിൽക്കുന്ന രീതി') ,
        centerTitle: true,
        backgroundColor: app_theam,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Text(DocumentId),
              InputField(hint: 'ഉല്‍പ്പന്നം', controller:dataSalesprdct2, onchanged: (value){
providerone.updateDataSalesprdct2(value);
              }),
              InputField(hint: 'അളവ്‌', controller: dataSalesquntum2, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataSalesquntum2(valuee);
              }),
              InputField(hint: 'വിപണന രീതി ', controller: dataSalessalesmethod, onchanged: (value){
                providerone.updateDataSalessalesmethod(value);
              }),
              ElevateClick(
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCrpDetail(items: widget.items),));
              }, text:'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
