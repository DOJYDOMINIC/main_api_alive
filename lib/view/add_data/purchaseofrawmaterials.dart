
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/sales.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/headings_between.dart';
import '../widgets/input_field.dart';

class Purchaseofrawmaterials extends StatefulWidget {
  const Purchaseofrawmaterials({Key? key,})
      : super(key: key);

  @override

  State<Purchaseofrawmaterials> createState() => _PurchaseofrawmaterialsState();
}

class _PurchaseofrawmaterialsState extends State<Purchaseofrawmaterials> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headings(text: 'അസംസ്‌കൃത വസ്തുക്കൾ വാങ്ങുന്നരീതി'),
            InputField(
              hint: 'ഇനം',
              controller: dataPurchaseofrawmaterialsItemtype,
              onchanged: (value) {
              },
            ),
            InputField(
              hint: 'വാങ്ങുന്ന അളവ് (മാസം/kg ltr)',
              controller: dataPurchaseofrawmaterialsQuantity,
              onchanged: (value) {
              },
            ),
            InputField(hint: 'വാങ്ങുന്ന വില (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsPrice, onchanged: (value){}),
            InputField(hint: 'ബ്രാൻഡ്', controller: dataPurchaseofrawmaterialsBrand, onchanged:(value){}),
            InputField(hint: 'സ്വയം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsOwn, onchanged: (value){}),
            InputField(hint: 'റീറ്റെയ്ൽ (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsRetail, onchanged: (value){}),
            InputField(hint: 'വില ', controller:dataPurchaseofrawmaterialsP2, onchanged: (value){}),
            InputField(hint: 'ഹോൾസെയിൽ ', controller: dataPurchaseofrawmaterialsWholesale, onchanged: (value){}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP3, onchanged: (value){}),
            InputField(hint: 'സംഘം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsGroup, onchanged: (value){}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP4, onchanged: (value){}),
            InputField(hint: 'സബ്‌സിഡി(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsSubsidy, onchanged: (value){}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP5, onchanged: (value){}),
            // Text(DocumentId),
            ElevateClick(
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SalesData(),));
                },
                text: 'Next')
          ],
        ),
      ),
    );
  }
}
