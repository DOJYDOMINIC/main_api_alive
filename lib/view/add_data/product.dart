
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/add_data/purchaseofrawmaterials.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/elevate_click_button.dart';
import '../widgets/input_field.dart';


class Product extends StatefulWidget {
  const Product({Key? key,}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  TextEditingController dataProductsPrdct = TextEditingController();
  TextEditingController dataProductsQuantum = TextEditingController();
  TextEditingController dataProductsPrice2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: app_theam,),
        body: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
      InputField(
            hint: 'ഉല്‍പ്പന്നം',
            controller: dataProductsPrdct,
            onchanged: (value) {
            }),
      InputField(
            hint: 'അളവ് /എണ്ണം ',
            controller: dataProductsQuantum,
            onchanged: (value) {
            }),
      InputField(
          hint: 'വില (Rs/KG/Lit/ Number)',
          controller: dataProductsPrice2,
          onchanged: (value) {
          },
          keytype: TextInputType.number,
      ),
      ElevateClick(
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Purchaseofrawmaterials(),));
            },
            text: 'Next'),
    ]),
        ));
  }
}
