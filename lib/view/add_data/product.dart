// import 'package:flutter/material.dart';
// import 'package:main200623/constant/color_text.dart';
// import 'package:main200623/view/add_data/purchaseofrawmaterials.dart';
// import 'package:main200623/view/lists.dart';
// import 'package:provider/provider.dart';
// import '../../control/text_controller.dart';
// import '../widgets/dropdown_nosearch.dart';
// import '../widgets/elevate_click_button.dart';
// import '../widgets/input_field.dart';
//
// class Product extends StatefulWidget {
//   const Product({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Product> createState() => _ProductState();
// }
//
// class _ProductState extends State<Product> {
//   TextEditingController dataProductsPrdct = TextEditingController();
//   TextEditingController dataProductsQuantum = TextEditingController();
//   TextEditingController dataProductsPrice2 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     var providerone = Provider.of<TextMain>(context, listen: false);
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('ഉല്‍പ്പന്ന  വിവരം '),
//           centerTitle: true,
//           backgroundColor: app_theam,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   NoSearchDropdown(
//                     onChanged: (value) {
//                       providerone.updateDataProductsPrdct(value);
//                     },
//                     items: products,
//                     item: 'ഉല്‍പ്പന്നം',
//                   ),
//                   // InputField(
//                   //         hint: 'ഉല്‍പ്പന്നം',
//                   //         controller: dataProductsPrdct,
//                   //         onchanged: (value) {
//                   //           providerone.updateDataProductsPrdct(value);
//                   //         }),
//                   InputField(
//                       hint: 'അളവ് /എണ്ണം ',
//                       controller: dataProductsQuantum,
//                       onchanged: (value) {
//                         int? valuee = int.tryParse(value);
//                         providerone.updateDataProductsQuantum(valuee);
//                       }),
//                   InputField(
//                     hint: 'വില (Rs/KG/Lit/ Number)',
//                     controller: dataProductsPrice2,
//                     onchanged: (value) {
//                       int? valuee = int.tryParse(value);
//                       providerone.updateDataProductsPrice2(valuee);
//                     },
//                     keytype: TextInputType.number,
//                   ),
//                   ElevateClick(
//                       ontap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Purchaseofrawmaterials(),
//                             ));
//                       },
//                       text: 'Next'),
//                 ]),
//           ),
//         ));
//   }
// }
