
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/purchaseofrawmaterials.dart';
import 'package:main200623/view/update/updatepurchaseofrawmaterials.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';


class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key, this.items,}) : super(key: key);
final items;
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController dataProductsPrdct = TextEditingController();
  TextEditingController dataProductsQuantum = TextEditingController();
  TextEditingController dataProductsPrice2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('ഉല്‍പ്പന്ന  വിവരം '),
        centerTitle: true,
        backgroundColor: app_theam,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
      InputField(
              hint: 'ഉല്‍പ്പന്നം',
              controller: dataProductsPrdct,
              onchanged: (value) {
                providerone.updateDataProductsPrdct(value);
              }),
      InputField(
              hint: 'അളവ് /എണ്ണം ',
              controller: dataProductsQuantum,
              onchanged: (value) {
                int? valuee = int.tryParse(value);
                providerone.updateDataProductsQuantum(valuee);
              }),
      InputField(
            hint: 'വില (Rs/KG/Lit/ Number)',
            controller: dataProductsPrice2,
            onchanged: (value) {
              int? valuee = int.tryParse(value);
              providerone.updateDataProductsPrice2(valuee);
            },
            keytype: TextInputType.number,
      ),
      ElevateClick(
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePurchaseofrawmaterials(items: widget.items),));
              },
              text: 'Next'),
    ]),
          ),
        ));
  }
}
