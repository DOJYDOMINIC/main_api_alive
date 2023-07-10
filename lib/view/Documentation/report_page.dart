import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/login.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
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

  String? dataone;
  String? datatwo;
  String? datathree;
  String? productname;
  List? business = [];
  String? businessString;
  List? traninglist = [];
  String? traning;



  String? dist;
  String? panchayth;
  String? blockss;
  List<String> blocklist = [];
  List<String> panchaths = [];



  Future<void> startDownloading(String panchayth, String dataone,
      String token) async {
    final String url =
        '${api}search/class1?data_Panchayath=$panchayth&data_Class=$dataone';

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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }

  Future<void> dataclasstwo(String panchayth, String datatwo,
      String token) async {
    final String url =
        '${api}search/class1?data_Panchayath=$panchayth&data_Class=$datatwo';

    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "dataclass2_${timeStamp}.xlsx";

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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }


  Future<void> Businesstype(String panchayth, String businessString, String token) async {
    final String url =
        '${api}search/detailsofAnimalHusbandryBusiness?selectedPanchayath=$panchayth&selectedBusinessType=$businessString';

    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "business type ${timeStamp}.xlsx";

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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }

  Future<void> TraningRequaredd(String panchayth, String traning, String token) async {
    final String url =
        '${api}search/TrainingsRequired?data_Panchayath=$panchayth&data_Trainingsrequired=$traning';

    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "Trainingsrequired${timeStamp}.xlsx";

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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }

  Future<void> dtaclassThree(String panchayth, String datathree,
      String token) async {
    final String url =
        '${api}search/class3?data_Panchayath=$panchayth&data_Class3=$datathree';

    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "data class3 ${timeStamp}.xlsx";

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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }
    Navigator.pop(context);
  }

  Future<void> productName(String panchayth, String productname,
      String token) async {
    final String url =
        '${api}search/productDetails?panchayath=$panchayth&products_Name=$productname';


    String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
    String fileName = "product detail${timeStamp}.xlsx";
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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers

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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }
    Navigator.pop(context);
  }



  Future<void> landdetails(String panchayth, String token) async {
    final String url = '${api}search/landdetails?selectedPanchayath=$panchayth';


    String timeStamp = DateFormat("ddMMyyyy_hh:mm:ss").format(DateTime.now());
    String fileName = "Land Details ${timeStamp}.xlsx";
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
            headers: {
              'Authorization': 'Bearer $authToken'
            }, // Pass the token in the request headers
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
                    Navigator.of(context)
                        .pop(); // Close the dialog and the downloading dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Permission denied by the user, show an error message or handle accordingly
        print("Permission denied by the user");
        Navigator.pop(
            context); // Close the dialog if the download cannot be started
      }
    }

    Navigator.pop(context);
  }

  //==========================================

  Future<String> _getFilePath(String filename) async {
    // final dir = await getApplicationDocumentsDirectory();
    // ${dir.path}
    return "/storage/emulated/0/Download/$filename";
  }

  //==========================================


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
      final response = await http.get(
          Uri.parse('${api}search/listBlocks?data_district=$dist'));
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
      final response = await http.get(
          Uri.parse('${api}search/listPanchayats?data_Block=$blockss'));

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
  void initState() {
    super.initState();
    fetchDistricts();
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
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_copy, size: 50, color: app_theam),
                  Text('Report', style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: app_theam),)
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
            SizedBox(height: 10,),
            // ======================
            if(panchayth != null)
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps<String>.menu(
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: dataclass,
                          onChanged: (value) {
                            setState(() {
                              dataone = value;
                            });
                          },
                          selectedItem: 'കുടുംബ അവസ്ഥ',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(borderSide: BorderSide(
                                      color: Colors.white)))),
                        ),
                      ),
                      IconButton(onPressed: () {
                        startDownloading(panchayth!, dataone!, authToken!);
                      }, icon: Icon(Icons.download))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                //  =======================
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps<String>.menu(
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: dataclass2,
                          onChanged: (value) {
                            setState(() {
                              datatwo = value;
                            });
                          },
                          selectedItem: 'വിഭാഗം',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(borderSide: BorderSide(
                                      color: Colors.white)))),
                        ),
                      ),
                      IconButton(onPressed: () {
                        print(datatwo);
                        dataclasstwo(panchayth!, datatwo!, authToken!);
                      }, icon: Icon(Icons.download))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                //=======================
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps<String>.menu(
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: datacls3,
                          onChanged: (value) {
                            setState(() {
                              datathree = value;
                            });
                          },
                          selectedItem: 'പ്രത്യേക വിഭാഗം',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(borderSide: BorderSide(
                                      color: Colors.white)))),
                        ),
                      ),
                      IconButton(onPressed: () {
                        setState(() {
                          dtaclassThree(panchayth!, datathree!, authToken!);
                        });
                      }, icon: Icon(Icons.download))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .8,
                      child: MultiSelectFormField(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black)),
                          title: Text(
                            'മൃഗ സംരക്ഷണ മേഖലയിൽ ചെയ്യുന്ന ബിസിനസ്സ് ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          dataSource: businesstype,
                          textField: 'disply',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          // hintText: 'Please select one or more options',
                          initialValue: business,
                          onSaved: (value) {
                            setState(() {
                              business = value;
                              businessString = business!.join(',');
                            });
                          }),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Businesstype(panchayth!,businessString!,authToken!);
                            print(businessString);
                            // print(businessString);
                          });
                        }, icon: Icon(Icons.download))
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: MultiSelectFormField(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black)),
                          title: Text(
                            'പരിശീലനം വേണ്ട മേഘല ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          dataSource: traingrequared,
                          textField: 'text',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          // hintText: 'Please select one or more options',
                          initialValue: traninglist,
                          onSaved: (value) {
                            setState(() {
                              traninglist = value;
                              traning = traninglist!.join(',');
                            });
                          }),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            TraningRequaredd(panchayth!,traning!,authToken!);
                            print('value :$traninglist');
                            // print(businessString);
                          });
                        }, icon: Icon(Icons.download))
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  child: Row(
                    children: [
                      Container(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text('പുരയിടം/നിലം'),
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              landdetails(panchayth!, authToken!);
                            });
                          }, icon: Icon(Icons.download))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                //=======================
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps<String>.menu(
                            showSelectedItems: true,
                            // disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: products,
                          onChanged: (value) {
                            setState(() {
                              productname = value;
                            });
                          },
                          selectedItem: 'ഉല്‍പ്പന്നം',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(borderSide: BorderSide(
                                      color: Colors.white)))),
                        ),
                      ),
                      IconButton(onPressed: () {
                        setState(() {
                          productName(panchayth!, productname!, authToken!);
                        });
                      }, icon: Icon(Icons.download))
                    ],
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}
