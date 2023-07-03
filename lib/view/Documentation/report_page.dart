
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/login.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../services/add_api.dart';
import '../lists.dart';
import '../widgets/dropdown_nosearch.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}




class _ReportPageState extends State<ReportPage> {
  Dio dio = Dio();
  double progress = 0.0;
  String? apl;
  String? dist;
  List<String> blocklist = [];
  List<String> panchaths = [];
  String? panchayth;
  String? blockss;


  Future<void> startDownloading(String panchayth,String apl, String token) async {
    final String url =
        '${api}search/class1?data_Panchayath=$panchayth&data_Class=$apl';

    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "dataclass_${timeStamp}.xlsx";

    String path = await _getFilePath(fileName);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        await dio.download(
          url,
          path,
          options: Options(
            headers: {'Authorization': 'Bearer $authToken'}, // Pass the token in the request headers

          ),
          onReceiveProgress: (receivedBytes, totalBytes) {
            setState(() {
              progress = receivedBytes / totalBytes;
            });
            print(progress);
          },
          deleteOnError: true,
        );
      } catch (e) {
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        // await startDownloading();
      } else if (status.isPermanentlyDenied) {
        // Permission permanently denied, show a dialog to open app settings
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Permission Required'),
              content: const Text(
                  'Please grant storage permission in app settings to continue.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Open Settings'),
                  onPressed: () {
                    openAppSettings();
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }


  Future<String> _getFilePath(String filename) async {
    // final dir = await getApplicationDocumentsDirectory();
    // ${dir.path}
    return "/storage/emulated/0/Download/$filename";
  }

  @override
  void initState() {
    super.initState();
    fetchDistricts();
  }


  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {

    try {
      final response = await http.get(Uri.parse('${api}search/listDistricts'));

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


  Future<void> fetchBlocks(String selectedDistrict) async {

    try {
      final response = await http.get(Uri.parse('${api}search/listBlocks?data_district=$dist'));
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

  Future<void> fetchPanchayth(String selectpanchaayth) async {

    try {
      final response = await http.get(Uri.parse('${api}search/listPanchayats?data_Block=$blockss'));

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


  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    // var providerone = Provider.of<TextMain>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
        title: Text('Documentation'),
        centerTitle: true,
        backgroundColor: app_theam,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_copy,size: 50,color: app_theam),
                  Text('Report',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: app_theam),)
                ],
              ),
            ),
            NoSearchDropdown(
              items: districts,
              onChanged: (value) {
                setState(() {
                  dist = value;
                  fetchBlocks(dist!);
                });
              },
              selecteditem: 'ജില്ല',
            ),


            NoSearchDropdown(
              onChanged: (value) {
                setState(() {
                  blockss = value;
                  fetchPanchayth(blockss!);
                });
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
                },
                items: panchaths,
                selecteditem: 'പഞ്ചായത്ത്'),
            NoSearchDropdown(
              items: dataclass,
              onChanged: (value) {
                setState(() {
                  apl = value;
                  // print(apl);
                });
              },
              selecteditem: 'വിഭാഗം',
            ),
            ElevateClick(ontap: (){
                startDownloading(panchayth!,apl!,authToken!);
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Downloading: $downloadingprogress%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                );
              },);
            }, text:'Download')
           ],
          ),
        ),
      ),
    );
  }
}
