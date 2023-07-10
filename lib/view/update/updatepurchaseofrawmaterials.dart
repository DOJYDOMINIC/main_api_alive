
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
import 'package:main200623/view/update/updatesales.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/headings_between.dart';
import '../widgets/input_field.dart';

class UpdatePurchaseofrawmaterials extends StatefulWidget {
  const UpdatePurchaseofrawmaterials({Key? key, this.items,})
      : super(key: key);
final items;
  @override

  State<UpdatePurchaseofrawmaterials> createState() => _UpdatePurchaseofrawmaterialsState();
}

class _UpdatePurchaseofrawmaterialsState extends State<UpdatePurchaseofrawmaterials> {
  TextEditingController dataPurchaseofrawmaterialsItemtype =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsQuantity =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsPrice =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsBrand =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsOwn =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsRetail =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP2 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsWholesale =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP3 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsGroup =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP4 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsSubsidy =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP5 =
      TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('അസംസ്‌കൃത വസ്തുക്കൾ\nവാങ്ങുന്നരീതി'),
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Headings(text: 'അസംസ്‌കൃത വസ്തുക്കൾ വാങ്ങുന്നരീതി'),
              InputField(
                hint: 'ഇനം',
                controller: dataPurchaseofrawmaterialsItemtype,
                onchanged: (value) {
                  providerone.updateDataPurchaseofrawmaterialsItemtype(value);
                },
              ),
              InputField(
                hint: 'വാങ്ങുന്ന അളവ് (മാസം/kg ltr)',
                controller: dataPurchaseofrawmaterialsQuantity,
                onchanged: (value) {
                  int? valuee = int.tryParse(value);
                  providerone.updateDataPurchaseofrawmaterialsQuantity(valuee);
                },
              ),
              InputField(hint: 'വാങ്ങുന്ന വില (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsPrice, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsPrice(valuee);
              }),
              InputField(hint: 'ബ്രാൻഡ്', controller: dataPurchaseofrawmaterialsBrand, onchanged:(value){
                providerone.updateDataPurchaseofrawmaterialsBrand(value);
              }),
              InputField(hint: 'സ്വയം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsOwn, onchanged: (value){
                providerone.updateDataPurchaseofrawmaterialsOwn(value);
              }),
              InputField(hint: 'റീറ്റെയ്ൽ (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsRetail, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsRetail(valuee);
              }),
              InputField(hint: 'വില ', controller:dataPurchaseofrawmaterialsP2, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsP2(valuee);
              }),
              InputField(hint: 'ഹോൾസെയിൽ ', controller: dataPurchaseofrawmaterialsWholesale, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsWholesale(valuee);

              }),
              InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP3, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsP3(valuee);

              }),
              InputField(hint: 'സംഘം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsGroup, onchanged: (value){
                int? valuee = int.tryParse(value);
                providerone.updateDataPurchaseofrawmaterialsGroup(valuee);

              }),
              InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP4, onchanged: (value){
                providerone.updateDataPurchaseofrawmaterialsP4(value);

              }),
              InputField(hint: 'സബ്‌സിഡി(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsSubsidy, onchanged: (value){
                providerone.updateDataPurchaseofrawmaterialsSubsidy(value);

              }),
              InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP5, onchanged: (value){
                providerone.updateDataPurchaseofrawmaterialsP5(value);

              }),
              // Text(DocumentId),
              ElevateClick(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSalesData(items: widget.items),));
                  },
                  text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
