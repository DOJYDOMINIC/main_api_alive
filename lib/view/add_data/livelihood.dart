
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/product.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';

class LivelihoodValue extends StatefulWidget {
  const LivelihoodValue({Key? key,}) : super(key: key);

  @override
  State<LivelihoodValue> createState() => _SalesState();
}

class _SalesState extends State<LivelihoodValue> {

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
      appBar: AppBar(backgroundColor: app_theam),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(DocumentId),
            InputField(hint: 'ഉപജീവന തൊഴിൽ', controller:datalivelihoodincomesource, onchanged: (value){
              providerone.updateDatalivelihoodincomesource(value);
            }),
            InputField(hint: 'എണ്ണം‌', controller: datalivelihoodnumbers, onchanged: (value){
              providerone.updateDatalivelihoodnumbers(value);
            }),
            InputField(hint: 'മൂലധന സ്രോതസ് (സ്വന്തം/പദ്ധതി) എഴുതുക', controller: datalivelihoodcapitalsource, onchanged: (value){
              providerone.updateDatalivelihoodcapitalsource(value);
            }),
            InputField(hint: 'പ്രീതിമാസം വരുമാനം ', controller: datalivelihoodrevenue, onchanged: (value){
              providerone.updateDatalivelihoodrevenue(value);
            }),
            ElevateClick(
                ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Product(),));
                }, text:'Next'),
          ],
        ),
      ),
    );
  }
}
