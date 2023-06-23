// import 'package:flutter/material.dart';
// import 'package:main200623/view/widgets/dropdown_nosearch.dart';
// import '../../model/personal_model.dart';
// import '../../services/api_services.dart';
// import '../constant/color_text.dart';
// import 'lists.dart';
//
// class DistrictDropdown extends StatefulWidget {
//   @override
//   _DistrictDropdownState createState() => _DistrictDropdownState();
// }
//
// TextEditingController aplbpl = TextEditingController();
//
// class _DistrictDropdownState extends State<DistrictDropdown> {
//
//   List<String> districts = [];
//   String? selectedDistrict;
//   List<String> blocks = [];
//   String? selectedBlock;
//   List<String> panchayats = [];
//   String? selectedPanchayat;
//   List<String> additionalData = [];
//   Future<Personalmodel>? personalData;
//   String? aplbpl;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchDistricts();
//   }
//
//   Future<void> fetchDistricts() async {
//     try {
//       final fetchedDistricts = await DistrictApi.fetchDistricts();
//       setState(() {
//         districts = fetchedDistricts;
//         selectedDistrict = districts.isNotEmpty ? districts[0] : null;
//       });
//     } catch (e) {
//       // Handle error
//       print('Error fetching districts: $e');
//     }
//   }
//
//   Future<void> fetchBlocks() async {
//     try {
//       final fetchedBlocks = await BlockApi.fetchBlocks(selectedDistrict!);
//       setState(() {
//         blocks = fetchedBlocks;
//         selectedBlock = blocks.isNotEmpty ? blocks[0] : null;
//       });
//     } catch (e) {
//       // Handle error
//       print('Error fetching blocks: $e');
//     }
//   }
//
//   Future<void> fetchPanchayatsByBlock() async {
//     try {
//       final fetchedPanchayats =
//       await PanchayatApi.fetchPanchayatsByBlock(selectedBlock!);
//       setState(() {
//         panchayats = fetchedPanchayats;
//         selectedPanchayat = panchayats.isNotEmpty ? panchayats[0] : null;
//         fetchPersonalData(); // Call fetchPersonalData after panchayats are fetched
//       });
//     } catch (e) {
//       // Handle error
//       print('Error fetching panchayats: $e');
//     }
//   }
//
//
//   Future<void> fetchPersonalData() async {
//     if (selectedPanchayat != null) {
//       final dataFetcher = PersonalDataFetcher();
//       setState(() {
//         personalData = dataFetcher.fetchPersonalData(
//           selectedPanchayat!,
//               aplbpl!,
//             1,
//           10,
//         );
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         backgroundColor: app_theam,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Select District:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: selectedDistrict,
//                       items: districts.map((String district) {
//                         return DropdownMenuItem<String>(
//                           value: district,
//                           child: Text(
//                             district,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         );
//                       }).toList(),
//                       icon: Icon(
//                         Icons.arrow_drop_down,
//                         color: Colors.black,
//                       ),
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                       onChanged: (String? value) {
//                         setState(() {
//                           selectedDistrict = value;
//                           fetchBlocks();
//                         });
//                         print('Selected district: $value');
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Select Block:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: selectedBlock,
//                       items: blocks.map((String block) {
//                         return DropdownMenuItem<String>(
//                           value: block,
//                           child: Text(
//                             block,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         );
//                       }).toList(),
//                       icon: Icon(
//                         Icons.arrow_drop_down,
//                         color: Colors.black,
//                       ),
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                       onChanged: (String? value) {
//                         setState(() {
//                           selectedBlock = value;
//                           fetchPanchayatsByBlock();
//                         });
//                         print('Selected block: $value');
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Select Panchayat:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: selectedPanchayat,
//                       items: panchayats.map((String panchayat) {
//                         return DropdownMenuItem<String>(
//                           value: panchayat,
//                           child: Text(panchayat, style: TextStyle(fontSize: 16),),);}).toList(),
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
//                       style: TextStyle(fontSize: 16, color: Colors.black,),
//                       onChanged: (value) {
//                         setState(() {selectedPanchayat = value;});
//                         print('Selected panchayat: $value');
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               NoSearchDropdown(
//                   onChanged: (value) {
//                     setState(() {
//                       aplbpl =value;
//                     });
//                   },
//                   items: dataclass,
//                   selecteditem: aplbpl),
//               ElevatedButton(
//                 onPressed: () {
//                   fetchPersonalData();
//                   print(fetchPersonalData);
//                 },
//                 child: Text('child'),
//               ),
//               SizedBox(height: 10,),
//               FutureBuilder<Personalmodel>(
//                 future: personalData,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else if (snapshot.hasData) {
//                     final personalData = snapshot.data!;
//                     return Container(
//                       height: 250,
//                       child: ListView.builder(
//                         itemCount: personalData.data.length,
//                         itemBuilder: (context, index) {
//                           final datum = personalData.data[index];
//                           return ListTile(
//                             title: Text(datum.dataName),
//                             subtitle: Text(datum.dataClass.toString()),
//                             // trailing: Text(datum.),
//                           );
//                         },
//                       ),
//                     );
//                   } else {
//                     return Text('No personal data available');
//                   }
//                 },
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
