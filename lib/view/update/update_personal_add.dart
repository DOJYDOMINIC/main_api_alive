// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:main200623/constant/color_text.dart';
// import 'package:multiselect_formfield/multiselect_formfield.dart';
// import '../lists.dart';
// import '../widgets/dropdown_container_model.dart';
// import '../widgets/dropdown_nosearch.dart';
// import '../widgets/elevate_click_button.dart';
// import '../widgets/headings_between.dart';
// import '../widgets/input_field.dart';
// import 'update_familydata.dart';
//
// enum CheckboxOption { applied, sanctioned, notApplied }
//
// class UpdatePersonalPage extends StatefulWidget {
//   const UpdatePersonalPage({Key? key}) : super(key: key);
//
//   @override
//   State<UpdatePersonalPage> createState() => _UpdatePersonalPageState();
// }
//
// class _UpdatePersonalPageState extends State<UpdatePersonalPage> {
//   TextEditingController dataName = TextEditingController();
//   TextEditingController dataAddress = TextEditingController();
//   TextEditingController dataPhonenumber = TextEditingController();
//   TextEditingController dataNameofNg = TextEditingController();
//   TextEditingController dataNameofNGmember = TextEditingController();
//   TextEditingController dataYearofstartingagriculture = TextEditingController();
//   TextEditingController dataYearofstartingbussiness = TextEditingController();
//   TextEditingController dataAmountinvested = TextEditingController();
//   TextEditingController dataSupportrecived = TextEditingController();
//   TextEditingController dataBusinessidea = TextEditingController();
//   TextEditingController dataDistrict = TextEditingController();
//   TextEditingController dataBlock = TextEditingController();
//   TextEditingController dataPanchayth = TextEditingController();
//   TextEditingController dataWard = TextEditingController();
//   TextEditingController dataClass = TextEditingController();
//   TextEditingController dataClass2 = TextEditingController();
//   TextEditingController dataClass3 = TextEditingController();
//   TextEditingController dataFamilyincome = TextEditingController();
//   TextEditingController datalanddetailslandarea = TextEditingController();
//   TextEditingController dataSupport = TextEditingController();
//   TextEditingController datalanddetailsagricultureland =
//       TextEditingController();
//   TextEditingController dataInfraOthers = TextEditingController();
//
//   List dataclass3 = [];
//   List dataAnimalhusbendaryBusinesstype = [];
//   List dataSourceofinvestment = [];
//   bool isYesSelected = false;
//   String cdsNumber = '';
//   String cdsName = '';
//
//   CheckboxOption selectedOption = CheckboxOption.notApplied;
//   String totalInvestment = '';
//   String dateOfLoanApplication = '';
//
//   // --------------------DateController---------------
//   TextEditingController datePickerController = TextEditingController();
//   TextEditingController selectedDateController = TextEditingController();
//
//   // ----------------------------------------------------
//
//   onTapFunction({required BuildContext context}) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       lastDate: DateTime.now(),
//       firstDate: DateTime(2015),
//       initialDate: DateTime.now(),
//     );
//     if (pickedDate == null) return;
//     String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
//
//     datePickerController.text = formattedDate;
//   }
//
//   onTapFunction2({required BuildContext context}) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       lastDate: DateTime.now(),
//       firstDate: DateTime(2015),
//       initialDate: DateTime.now(),
//     );
//
//     if (pickedDate == null) return;
//     String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
//
//     selectedDateController.text = formattedDate;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('വ്യക്തിവിവരം '),
//           centerTitle: true,
//           backgroundColor: app_theam,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [
//               NoSearchDropdown(
//                 items: block,
//                 onChanged: (value) {},
//                 selecteditem: 'ജില്ല',
//               ),
//               DropdownContainerModel(
//                 onChanged: (value) {},
//                 hint: 'ബ്ലോക്ക്',
//                 items: block,
//               ),
//               DropdownContainerModel(
//                   onChanged: (value) {}, items: panchayth, hint: 'പഞ്ചായത്ത്'),
//               InputField(
//                 hint: 'വാർഡ്',
//                 controller: dataWard,
//                 keytype: TextInputType.number,
//                 onchanged: (value) {},
//               ),
//               InputField(
//                 hint: 'സംരംഭകയുടെ പേര്',
//                 controller: dataName,
//                 onchanged: (value) {},
//               ),
//               InputField(
//                   hint: 'വിലാസം',
//                   controller: dataAddress,
//                   onchanged: (value) {}),
//               InputField(
//                   hint: 'ഫോൺ നമ്പർ',
//                   controller: dataPhonenumber,
//                   onchanged: (value) {},
//                   keytype: TextInputType.number),
//               NoSearchDropdown(
//                   onChanged: (value) {},
//                   items: dataclass,
//                   selecteditem: 'കുടുംബ അവസ്ഥ'),
//               NoSearchDropdown(
//                   onChanged: (value) {}, items: dataclass2, selecteditem: 'വിഭാഗം'),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: MultiSelectFormField(
//                     title: Text(
//                       'പ്രത്യേക വിഭാഗം',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     dataSource: options,
//                     textField: 'text',
//                     valueField: 'value',
//                     okButtonLabel: 'OK',
//                     cancelButtonLabel: 'CANCEL',
//                     // hintText: 'Please select one or more options',
//                     initialValue: dataclass3,
//                     onSaved: (value) {
//                       if (value == null) return;
//                     },
//                   ),
//                 ),
//               ),
//               NoSearchDropdown(
//                   onChanged: (value) {},
//                   items: familyincome,
//                   selecteditem: 'കുടുംബ മാസവരുമാനം'),
//               InputField(
//                   hint: 'അയൽക്കൂട്ടത്തിന്റെ പേര്',
//                   controller: dataNameofNg,
//                   onchanged: (value) {}),
//               InputField(
//                   hint: 'അയൽക്കൂട്ട അംഗത്തിന്റെ പേര്',
//                   controller: dataNameofNGmember,
//                   onchanged: (value) {}),
//               NoSearchDropdown(
//                   onChanged: (value) {},
//                   items: position,
//                   selecteditem: 'അയൽക്കൂട്ടത്തിലെ പദവി'),
//               NoSearchDropdown(
//                   onChanged: (value) {}, items: house, selecteditem: 'വീട് '),
//               InputField(
//                 hint: 'പുരയിടം ( സെന്റ്)',
//                 controller: datalanddetailslandarea,
//                 onchanged: (value) {},
//                 keytype: TextInputType.number,
//               ),
//               InputField(
//                 hint: ' നിലം (സെന്റ്)',
//                 controller: datalanddetailsagricultureland,
//                 onchanged: (value) {},
//                 keytype: TextInputType.number,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: MultiSelectFormField(
//                     title: Text(
//                       'മൃഗ സംരക്ഷണ മേഖലയിൽ ചെയ്യുന്ന ബിസിനസ്സ് ',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     dataSource: businesstype,
//                     textField: 'disply',
//                     valueField: 'value',
//                     okButtonLabel: 'OK',
//                     cancelButtonLabel: 'CANCEL',
//                     // hintText: 'Please select one or more options',
//                     initialValue: dataAnimalhusbendaryBusinesstype,
//                     onSaved: (value) {
//                       if (value == null) return;
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Column(
//                     children: [
//                       Text(
//                         'സംരംഭം CDSൽ  രജിസ്റ്റർ ചെയ്‌തിട്ടുണ്ടോ ? ',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       CheckboxListTile(
//                         title: Text('Yes'),
//                         value: isYesSelected,
//                         onChanged: (value) {
//                           setState(() {
//                             isYesSelected = value!;
//                           });
//                         },
//                       ),
//                       CheckboxListTile(
//                         title: Text('No'),
//                         value: !isYesSelected,
//                         onChanged: (value) {
//                           setState(() {
//                             isYesSelected = !value!;
//                           });
//                         },
//                       ),
//                       if (isYesSelected) ...[
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextField(
//                             onChanged: (value) {
//                               setState(() {
//                                 cdsNumber = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത നമ്പർ ',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextField(
//                             onChanged: (value) {
//                               setState(() {
//                                 cdsName = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത പേര് ',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//               NoSearchDropdown(
//                   onChanged: (value) {},
//                   items: enterpricetype,
//                   selecteditem: 'സംരഭം തരം'),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: TextField(
//                     controller: datePickerController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
//                     ),
//                     onTap: () => onTapFunction(context: context),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: TextField(
//                     controller: selectedDateController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
//                     ),
//                     onTap: () => onTapFunction2(context: context),
//                   ),
//                 ),
//               ),
//               InputField(
//                 hint: 'ഇതുവരെ സംരംഭത്തിൽ മുടക്കിയ  തുക',
//                 controller: dataAmountinvested,
//                 onchanged: (value) {
//
//                 },
//                 keytype: TextInputType.number,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.black),
//                   ),
//                   child: MultiSelectFormField(
//                     title: Text(
//                       'മുടക്കുമുതൽ കണ്ടെത്തിയത് എവിടെനിന്ന് ',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     dataSource: sourceofinvestment,
//                     textField: 'source',
//                     valueField: 'value',
//                     okButtonLabel: 'OK',
//                     cancelButtonLabel: 'CANCEL',
//                     // hintText: 'Please select one or more options',
//                     initialValue: dataSourceofinvestment,
//                     onSaved: (value) {
//                       if (value == null) return;
//                     },
//                   ),
//                 ),
//               ),
//               InputField(
//                   hint: 'ലഭിച്ച പിന്തുണകൾ',
//                   controller: dataSupportrecived,
//                   onchanged: (value) {}),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Headings(text: 'ലോൺ'),
//                     ),
//                     CheckboxListTile(
//                       title: Text('Applied'),
//                       value: selectedOption == CheckboxOption.applied,
//                       onChanged: (value) {
//                         if (value ?? false) {
//                           setState(() {
//                             selectedOption = CheckboxOption.applied;
//                           });
//                           // updateDataLoan('applied');
//                         }
//                       },
//                     ),
//                     CheckboxListTile(
//                       title: Text('Sanctioned'),
//                       value: selectedOption == CheckboxOption.sanctioned,
//                       onChanged: (value) {
//                         if (value ?? false) {
//                           setState(() {
//                             selectedOption = CheckboxOption.sanctioned;
//                           });
//                           // updateDataLoan('sanctioned');
//                         }
//                       },
//                     ),
//                     CheckboxListTile(
//                       title: Text('Not Applied'),
//                       value: selectedOption == CheckboxOption.notApplied,
//                       onChanged: (value) {
//                         if (value ?? false) {
//                           setState(() {
//                             selectedOption = CheckboxOption.notApplied;
//                           });
//                           // updateDataLoan('notApplied');
//                         }
//                       },
//                     ),
//                     if (selectedOption == CheckboxOption.applied ||
//                         selectedOption == CheckboxOption.sanctioned) ...[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             TextField(
//                               onChanged: (value) {
//                                 setState(() {
//                                   totalInvestment = value;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 labelText: 'തുക',
//                               ),
//                             ),
//                             TextField(
//                               onChanged: (value) {
//                                 setState(() {
//                                   dateOfLoanApplication = value;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 labelText: 'തീയതി',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                     NoSearchDropdown(onChanged: (value){}, items:condition, selecteditem: 'ഷെഡ് / കൂട്'),
//                     NoSearchDropdown(onChanged: (value){}, items:condition, selecteditem: 'വെസ്റ്റേജ്'),
//                     NoSearchDropdown(onChanged: (value){}, items:condition, selecteditem: 'ബയോഗ്യാസ്'),
//                     NoSearchDropdown(onChanged: (value){}, items:condition, selecteditem: 'ഉപകരണങ്ങൾ'),
//                     InputField(hint: 'മറ്റുള്ളവ ', controller: dataInfraOthers,onchanged: (value) {},),
//                     InputField(hint: 'ആവശ്യമായ പിൻതുണ/സഹായം ', controller: dataSupport, onchanged: (value){}),
//                     ElevateClick(ontap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateFamilyData(),));
//                     }, text: 'Next'),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         ));
//   }
// }
