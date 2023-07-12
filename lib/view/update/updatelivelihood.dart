
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updateproduct.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class UpdateLivelihoodValue extends StatefulWidget {
  const UpdateLivelihoodValue({Key? key, this.items,}) : super(key: key);

  final items;

  @override
  State<UpdateLivelihoodValue> createState() => _SalesState();
}

class _SalesState extends State<UpdateLivelihoodValue> {

  TextEditingController datalivelihoodincomesource =
  TextEditingController();
  TextEditingController datalivelihoodnumbers =
  TextEditingController();
  TextEditingController datalivelihoodcapitalsource =
  TextEditingController();
  TextEditingController datalivelihoodrevenue =
  TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
          title: Text('ഉപജീവന വിവരം '),
          centerTitle: true,
          backgroundColor: app_theam),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Text(DocumentId),
              InputField(hint: 'ഉപജീവന തൊഴിൽ', controller:datalivelihoodincomesource, onchanged: (value){
                providerone.updateDatalivelihoodincomesource(value);
              }),
              InputField(hint: 'എണ്ണം‌', controller: datalivelihoodnumbers, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDatalivelihoodnumbers(valuee);
              }),
              InputField(hint: 'മൂലധന സ്രോതസ് (സ്വന്തം/പദ്ധതി) എഴുതുക', controller: datalivelihoodcapitalsource, onchanged: (value){
                providerone.updateDatalivelihoodcapitalsource(value);
              }),
              InputField(hint: 'പ്രീതിമാസം വരുമാനം ', controller: datalivelihoodrevenue, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDatalivelihoodrevenue(valuee);
              }),
              ElevateClick(
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(items: widget.items),));
                  }, text:'Next'),
            ],
          ),
        ),
      ),
    );
  }
}