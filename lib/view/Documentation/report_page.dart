
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../lists.dart';
import '../widgets/dropdown_nosearch.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}




class _ReportPageState extends State<ReportPage> {



  @override
  void initState() {
    super.initState();
    fetchDistricts();
  }


  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listDistricts'));

      if (response.statusCode == 200) {

        final data = json.decode(response.body);

        setState(() {
          districts = List.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          print(districts);
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
    }
  }

  String? dist;
  List<String> blocklist = [];


  Future<void> fetchBlocks(String selectedDistrict) async {

    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listBlocks?data_district=$dist'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          blocklist = List<String>.from(data);
          print(blocklist);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  List<String> panchaths = [];
  String? panchayth;
  String? blockss;

  Future<void> fetchPanchayth(String selectpanchaayth) async {

    try {
      final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          panchaths = List<String>.from(data);
          print(panchaths);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  String? apl;


  // void downloadExcelFile(String apiUrl, String selectedPanchath, String apl) async {
  //   try {
  //     final url = '$apiUrl?data_Panchayath=$selectedPanchath&data_Class=$apl';
  //     final request = http.Request('GET', Uri.parse(url));
  //
  //     final http.StreamedResponse response = await http.Client().send(request);
  //
  //     final String downloadDir = (await getExternalStorageDirectory())!.path;
  //     final String fileName = "data.xlsx";
  //     final String savePath = "$downloadDir/$fileName";
  //
  //     final File file = File(savePath);
  //     await file.writeAsBytes(await response.stream.toBytes());
  //
  //     // Show a dialog to inform the user about the successful download.
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Download Complete'),
  //         content: Text('The Excel file has been downloaded successfully.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } catch (e) {
  //     // Handle any errors that occur during the download process.
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('An error occurred while downloading the file.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }


  // Future<void> fetchclss2(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  // Future<void> fetchdataclss3(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatabusinesstype(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatalanddetais(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdataproductdetails(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatapurchaseofrawmaterials(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatatraining(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatamngregasupport(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }
  //
  // Future<void> fetchdatasupportrequared(String selectedBlocks) async {
  //
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.1.43:5000/api/search/listPanchayats?data_Block=$blockss'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         panchaths = List<String>.from(data);
  //         print(panchaths);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch blocks');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching blocks: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: Icon(Icons.file_copy,size: 50,color: app_theam),
            ),
            NoSearchDropdown(
              items: districts,
              onChanged: (value) {
                setState(() {
                  dist = value;
                  fetchBlocks(dist!);
                });
                // providerone.updateDataDistrict(value);
              },
              selecteditem: 'ജില്ല',
            ),


            NoSearchDropdown(
              onChanged: (value) {
                setState(() {
                  blockss = value;
                  fetchPanchayth(blockss!);
                });
                // providerone.updateDataBlock(value);
              },
              selecteditem: 'ബ്ലോക്ക്',
              items: blocklist,
            ),


            NoSearchDropdown(
                onChanged: (value) {
                  setState(() {
                    panchayth = value;
                    // fetchPanchayth(panchayth!);
                  });
                  // providerone.updateDataPanchayath(value);
                },
                items: panchaths,
                selecteditem: 'പഞ്ചായത്ത്'),
            NoSearchDropdown(
              items: dataclass,
              onChanged: (value) {
                setState(() {
                  apl = value;
                  print(apl);
                });
              },
              selecteditem: 'വിഭാഗം',
            ),
            NoSearchDropdown(
              items: block,
              onChanged: (value) {

              },
              selecteditem: 'ജില്ല',
            ),

            ElevateClick(ontap: (){
// print(fetchdataclss(panchayth!, apl!));
//               fetchdataclss(panchayth!,apl!);
//               final String apiUrl = 'http://192.168.1.43:5000/api/search/class1';
//               final String selectedPanchath = '$panchayth';
//               final String classnew = '$apl';
//               downloadExcelFile(apiUrl, selectedPanchath, classnew);
            }, text:'Download')
           ],
          ),
        ),
      ),
    );
  }
}
