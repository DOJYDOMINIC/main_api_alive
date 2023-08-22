import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/login.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List? mgnreg = [];
  String? mgnregstr;

  String? dist;
  String? panchayth;
  String? blockss;
  String? purchase;
  String? sublist;
  String? salesvalue;
  List<String> saleslist = [];
  List<String> blocklist = [];
  List<String> panchaths = [];
  List<String> listpurchase = [];
  List<String> sublistlist = [];
  List<String> selectedsupport = [];

  String panchayath = '';

  Future<void> _notification() async {
    // Create a new FlutterLocalNotificationsPlugin object.
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    // Create an AndroidNotificationDetails object.
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Download Completed',
      'Notification when download is completed',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      playSound: true,
    );
    // Create a NotificationDetails object.
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // Show the notification.
    await flutterLocalNotificationsPlugin.show(
      0,
      'Download Completed',
      'Your file has been downloaded successfully!',
      platformChannelSpecifics,
      payload: 'item_id', // You can use a relevant payload here
    );
    // Open the file when the notification is clicked.
    // await _openDownloadLocation();
  }

  bool permissionGranted = false;

  // Future<void> _getStoragePermission() async {
  //   DeviceInfoPlugin plugin = DeviceInfoPlugin();
  //   AndroidDeviceInfo android = await plugin.androidInfo;
  //   if (android.version.sdkInt < 33) {
  //     if (await Permission.storage.request().isGranted) {
  //       setState(() {
  //         permissionGranted = true;
  //       });
  //     } else if (await Permission.storage.request().isPermanentlyDenied) {
  //       await openAppSettings();
  //     } else if (await Permission.audio.request().isDenied) {
  //       setState(() {
  //         permissionGranted = false;
  //       });
  //     }
  //   } else {
  //     if (await Permission.photos.request().isGranted) {
  //       setState(() {
  //         permissionGranted = true;
  //       });
  //     } else if (await Permission.photos.request().isPermanentlyDenied) {
  //       await openAppSettings();
  //     } else if (await Permission.photos.request().isDenied) {
  //       setState(() {
  //         permissionGranted = false;
  //       });
  //     }
  //   }
  // }

  Future<void> startDownloading(
      String panchayth, String dataone, String token) async {
    final String url =
        '${api}search/class1?data_Panchayath=$panchayth&data_Class=$dataone';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String dataclass = "dataclass_${timeStamp}.xlsx";
    String path = await _getFilePath(dataclass);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
          // Perform any additional actions on successful download if needed.
        } else {
          showNoDataAvailableDialog(context);
          // Handle other status codes here (e.g., show an error message).
          print(
              "Error: Unexpected status code ${response.statusCode} during download.");
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await startDownloading(panchayth, dataone, token);
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
  }

  Future<void> dataclasstwo(
      String panchayth, String datatwo, String token) async {
    final String url =
        '${api}search/class2?data_Panchayath=$panchayth&data_Class2=$datatwo';
    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String class2 = "dataclass2_${timeStamp}.xlsx";

    String path = await _getFilePath(class2);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
          url,
          path,
          options: Options(
            headers: {
              // 'Content-Type': 'application/json',
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
          // Perform any additional actions on successful download if needed.
        } else {
          // Show "No data available" dialog
          showNoDataAvailableDialog(context);
          // Handle other status codes here (e.g., show an error message).
          print(
              "Error: Unexpected status code ${response.statusCode} during download.");
        }
      } catch (e) {
        // Example usage
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await dataclasstwo(panchayth, datatwo, authToken!);
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

    // Navigator.pop(context);
  }

  Future<void> Businesstype(
      String panchayth, String businessString, String token) async {
    final String url =
        '${api}search/detailsofAnimalHusbandryBusiness?selectedPanchayath=$panchayth&selectedBusinessType=$businessString';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String business = "business type ${timeStamp}.xlsx";

    String path = await _getFilePath(business);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        // Handle the error here (e.g., show an error message).
        showNoDataAvailableDialog(context);

        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await Businesstype(panchayth, businessString, authToken!);
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
                    // Navigator.of(context).pop(); // Close the dialog and the downloading dialog
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
    } // Navigator.pop(context);
  }

  Future<void> TraningRequaredd(
      String panchayth, String traning, String token) async {
    final String url =
        '${api}search/TrainingsRequired?data_Panchayath=$panchayth&data_Trainingsrequired=$traning';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String trainingsrequired = "Trainingsrequired_${timeStamp}.xlsx";

    String path = await _getFilePath(trainingsrequired);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download

      try {
        Response response = await dio.download(
          url,
          path,
          options: Options(
            headers: {
              'Authorization': 'Bearer $authToken',
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
        showNoDataAvailableDialog(context);
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        // await startDownloading();
        TraningRequaredd(panchayth, traning, authToken!);
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

    // Navigator.pop(context);
  }

  Future<void> dtaclassThree(
      String panchayth, String datathree, String token) async {
    final String url =
        '${api}search/class3?data_Panchayath=$panchayth&data_Class3=$datathree';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String class3 = "data_class3_${timeStamp}.xlsx";

    String path = await _getFilePath(class3);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        // await startDownloading();
        dtaclassThree(panchayth, datathree, authToken!);
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
    // Navigator.pop(context);
  }

  Future<void> productName(
      String panchayth, String productname, String token) async {
    final String url =
        '${api}search/productDetails?panchayath=$panchayth&products_Name=$productname';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String product = "product_detail${timeStamp}.xlsx";
    String path = await _getFilePath(product);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        // await startDownloading();
        productName(panchayth, productname, authToken!);
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
    // Navigator.pop(context);
  }

  Future<void> Sales(String panchayth, String sales, String token) async {
    final String url =
        '${api}search/salesReport?panchayath=$panchayth&products_Name=$sales';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String product = "Sales_${timeStamp}.xlsx";
    String path = await _getFilePath(product);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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

        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        // await startDownloading();
        await Sales(panchayth, salesvalue!, authToken!);
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
    // Navigator.pop(context);
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
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await landdetails(panchayth, authToken!);
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
    // Navigator.pop(context);
  }

  Future<void> Mgnreg(
    String panchayth,
    String mgnreg,
  ) async {
    final String url =
        '${api}search/detailsofMGNREGASupport?selectedPanchayath=$panchayth&MGNREGA_Support=$mgnreg';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String mgnre = "Mgnreg ${timeStamp}.xlsx";

    String path = await _getFilePath(mgnre);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
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
    // Navigator.pop(context);
  }

  Future<void> Purchasedata(
      String panchayth, String item, String? item2) async {
    String url =
        '${api}search/purchaseReport?panchayath=$panchayth&itemtype=$item';
    if (item2 != null) {
      url += '&subList=$item2';
    }

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String purchase = "purchase_item${timeStamp}.xlsx";

    String path = await _getFilePath(purchase);
    // print('Download Path: $path');
    // print('$url');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await Purchasedata(panchayth, purchase, sublist);
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
    // Navigator.pop(context);
  }

  //==================================
  Future<void> livelihoodApi(
      String _panchayth, String _item, String? _item2) async {
    String url = '${api}'
        'search/livelihoodReport?panchayath=$_panchayth&itemtype=$_item';
    if (_item2 != null) {
      url += '&subList=$_item2';
    }

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String purchase = "Livelihood${timeStamp}.xlsx";

    String path = await _getFilePath(purchase);
    // print('Download Path: $path');
    // print('$url');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");
          _notification();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        showNoDataAvailableDialog(context);
        // Handle the error here (e.g., show an error message).
        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await livelihoodApi(panchayth!, liveli_list!, liveli_sublist);
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
    // Navigator.pop(context);
  }

  //==================================

  Future<String> _getFilePath(String filename) async {
    // final dir = await getApplicationDocumentsDirectory();
    // ${dir.path}
    return "/storage/emulated/0/Download/$filename";
  }

  //==========================================

  List<String> districts = []; // Declare a global list variable

  Future<void> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String authToken = prefs.getString('authToken') ?? '';
    String email = prefs.getString('email') ?? '';
    String name = prefs.getString('name') ?? '';
    String district = prefs.getString('district') ?? '';
    String block = prefs.getString('block') ?? '';
    String panchayath = prefs.getString('panchayath') ?? '';

    if (panchayath != null || panchayath.isNotEmpty) {
      panchayth = panchayath;
    }
  }

  // Future<void> fetchDistricts() async {
  //   try {
  //
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     setState(() {
  //       panchayath = prefs.getString("panchayath").toString();
  //     });
  //     final response = await http.get(Uri.parse('${api}search/listDistricts'));
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //
  //       setState(() {
  //         districts = List.from(data); // Assign fetched data to the global list
  //         // selectedDistrict;
  //         print(districts);
  //       });
  //     } else {
  //       throw Exception('Failed to fetch districts');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching districts: $e');
  //   }
  // }

  Future<void> fetchBlocks(String selectedDistrict) async {
    try {
      final response = await http
          .get(Uri.parse('${api}search/listBlocks?data_district=$dist'));
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
      final response = await http
          .get(Uri.parse('${api}search/listPanchayats?data_Block=$blockss'));

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

  Future<void> Fetchpurchase() async {
    try {
      final response =
          await http.get(Uri.parse('${api}report/listpurchaserawmaterials'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          listpurchase =
              List.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          print(listpurchase);
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
    }
  }

  Future<void> Fetchpurchasesublist(String purchase) async {
    try {
      final response = await http.get(Uri.parse(
          '${api}report/listpurchaserawmaterials/sublist?data_purchaseofrawmaterials_itemtype=$purchase'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          sublistlist =
              List.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          print(sublistlist);
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
    }
  }

  Future<void> fetchsales() async {
    try {
      final response = await http.get(Uri.parse('${api}report/Sales'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          saleslist = List<String>.from(data);
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

  List<String> Livelihood_sublistlist = [];
  List<String> livelihood_api = [];
  String? liveli_list;
  String? liveli_sublist;

  Future<void> fetchLivelihood_List() async {
    try {
      final response =
          await http.get(Uri.parse('${api}report//livelihood_list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          livelihood_api = List<String>.from(data);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching fetchLivelihood_List: $e');
    }
  }

  Future<void> FetchLivelihood_sub_Api(String _livelihood) async {
    try {
      final response = await http.get(Uri.parse(
          '${api}report//livelihood_list/sublist?data_livelihood_incomesource=$_livelihood'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          Livelihood_sublistlist =
              List.from(data); // Assign fetched data to the global list
          // selectedDistrict;
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching FetchLivelihood_sub_Api: $e');
    }
  }

  List<dynamic> data_support = [];
  String? datasupprt_report;

  Future<void> fetchDataSupport(
      String panchayth, String datasupport, String token) async {
    final String url =
        '${api}report/dataSupport?data_Panchayath=$panchayth&data_supportrecived=$datasupport';

    String timeStamp = DateFormat("ddMMyyyy_hhmmss").format(DateTime.now());
    String business = "data_support_${timeStamp}.xlsx";

    String path = await _getFilePath(business);
    print('Download Path: $path');

    // Check if the storage permission is granted
    if (await Permission.storage.isGranted) {
      // Permission is granted, proceed with the download
      try {
        Response response = await dio.download(
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
        if (response.statusCode == 200) {
          // Download successful
          print("Download completed!");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text('Download completed!'),
            ),
          );
        } else {
          showNoDataAvailableDialog(context);
        }
      } catch (e) {
        // Handle the error here (e.g., show an error message).
        showNoDataAvailableDialog(context);

        print("Error while downloading: $e");
      }
    } else {
      // Permission is not granted, request the storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Permission granted by the user, start the download
        await fetchDataSupport(panchayth, datasupport, authToken!);
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
                    // Navigator.of(context).pop(); // Close the dialog and the downloading dialog
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
    } // Navigator.pop(context);
  }

  // Future<void> _openDownloadLocatio() async {
  //   String downloadPath = await ExternalPath.DIRECTORY_DOWNLOADS; // download path
  //   try {
  //     await OpenFile.open(downloadPath);
  //   } catch (e) {
  //     // Handle any errors that occur while opening the file
  //     print("Error opening download location: $e");
  //   }
  // }

  bool _permissionGranted = false;

  void _requestPermission() async {
    PermissionStatus permissionStatus =
        await Permission.manageExternalStorage.request();

    if (permissionStatus.isGranted) {
      setState(() {
        _permissionGranted = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Storage permission denied'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // fetchDistricts();
    Fetchpurchase();
    fetchsales();
    fetchLivelihood_List();
    getSavedData();
    // fetchDataSupport();
    // _getStoragePermission();
  }

// Function to show the "No data available" AlertDialog
  void showNoDataAvailableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Data Available'),
          content: Text('There is no data available.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> download() async {
    _requestPermission();
    if (await Permission.storage.request().isGranted) {
      _requestPermission();
      _openDownloadLocation();
      print('Storage permission granted');
    } else {
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
                  // Navigator.of(context).pop(); // Close the dialog and the downloading dialog
                },
              ),
            ],
          );
        },
      );
      // Permission not granted, show a dialog or take appropriate action
      print('Storage permission denied');
    }
  }

  void _openDownloadLocation() async {
    if (_permissionGranted = true) {
      String downloadPath = "/storage/emulated/0/Download/";
      await OpenFile.open(downloadPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Documentation'),
          centerTitle: true,
          backgroundColor: app_theam,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    download();
                  });
                },
                icon: Icon(
                  Icons.download_for_offline,
                  size: 30,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_copy, size: 50, color: app_theam),
                      Text(
                        'Report',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: app_theam),
                      ),
                    ],
                  ),
                ),
                // NoSearchDropdown(
                //   items: districts,
                //   onChanged: (value) {
                //     setState(() {
                //       dist = value;
                //       fetchBlocks(dist!);
                //     });
                //   },
                //   item: 'ജില്ല',
                // ),
                // NoSearchDropdown(
                //   onChanged: (value) {
                //     setState(() {
                //       blockss = value;
                //       fetchPanchayth(blockss!);
                //     });
                //   },
                //   item: 'ബ്ലോക്ക്',
                //   items: blocklist,
                // ),
                // NoSearchDropdown(
                //     onChanged: (value) {
                //       setState(() {
                //         panchayth = value;
                //         // fetchPanchayth(panchayth!);
                //       });
                //     },
                //     items: panchaths,
                //     item: 'പഞ്ചായത്ത്'),
                // SizedBox(
                //   height: 10,
                // ),
                // if (panchayth != null)
                Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black),
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
                              // selectedItem: 'കുടുംബ അവസ്ഥ',
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      labelText: 'കുടുംബ അവസ്ഥ',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white)))),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                try {
                                  startDownloading(
                                      panchayth!, dataone!, authToken!);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Please provide data!'),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //  =======================
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black),
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
                              // selectedItem: 'വിഭാഗം',
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      labelText: 'വിഭാഗം',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white)))),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                try {
                                  dataclasstwo(
                                      panchayth!, datatwo!, authToken!);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Please provide data!'),
                                    ),
                                  );
                                }
                                print(datatwo);
                              },
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //=======================
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black),
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
                              // selectedItem: 'പ്രത്യേക വിഭാഗം',
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      labelText: 'പ്രത്യേക വിഭാഗം',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white)))),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                try {
                                  dtaclassThree(
                                      panchayth!, datathree!, authToken!);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Please provide data!'),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
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
                              try {
                                Businesstype(
                                    panchayth!, businessString!, authToken!);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                              try {
                                TraningRequaredd(
                                    panchayth!, traning!, authToken!);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: MultiSelectFormField(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black)),
                              title: Text(
                                'ആവശ്യമായ പിൻതുണ/സഹായം',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              dataSource: datasupprtlistss,
                              textField: 'text',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              // hintText: 'Please select one or more options',
                              initialValue: data_support,
                              onSaved: (value) {
                                setState(() {
                                  data_support = value;
                                  datasupprt_report = data_support.join(',');
                                });
                              }),
                        ),
                        IconButton(
                            onPressed: () {
                              try {
                                fetchDataSupport(
                                    panchayth!, datasupprt_report!, authToken!);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: MultiSelectFormField(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black)),
                              title: Text(
                                'MGNREG ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              dataSource: datamgnregasupportlist,
                              textField: 'text',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              // hintText: 'Please select one or more options',
                              initialValue: mgnreg,
                              onSaved: (value) {
                                setState(() {
                                  mgnreg = value;
                                  mgnregstr = mgnreg!.join(',');
                                });
                              }),
                        ),
                        IconButton(
                            onPressed: () {
                              try {
                                Mgnreg(
                                  panchayth!,
                                  mgnregstr!,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * .8,
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
                                try {
                                  landdetails(panchayth!, authToken!);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Please provide data!'),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //=======================
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.black),
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
                              // selectedItem: 'ഉല്‍പ്പന്നം',
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      labelText: 'ഉല്‍പ്പന്നം',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white)))),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                try {
                                  productName(
                                      panchayth!, productname!, authToken!);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Please provide data!'),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.download))
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.black),
                          ),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps<String>.menu(
                              showSelectedItems: true,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: saleslist,
                            onChanged: (value) {
                              setState(() {
                                salesvalue = value;
                              });
                            },
                            // selectedItem: 'Sales',
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                    labelText: 'Sales',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)))),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              try {
                                Sales(panchayth!, salesvalue!, authToken!);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * .8,
                                // decoration: BoxDecoration(
                                //     border: Border(
                                //         bottom: BorderSide(color: Colors.black))),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps<String>.menu(
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: listpurchase,
                                  onChanged: (value) {
                                    setState(() {
                                      purchase = value;
                                      sublistlist.clear();
                                      Fetchpurchasesublist(purchase!);
                                      print(purchase);
                                    });
                                  },
                                  // selectedItem: 'purcaahse',
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: 'purcaahse',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide.none
                                      // )
                                      //
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * .8,
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps<String>.menu(
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: sublistlist,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        sublist = value;
                                      },
                                    );
                                  },
                                  selectedItem: 'purchase Sublist',
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      // labelText: 'purchase Sublist',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              try {
                                Purchasedata(panchayth!, purchase!, sublist);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * .8,
                                // decoration: BoxDecoration(
                                //     border: Border(
                                //         bottom:
                                //         BorderSide(color: Colors.black))),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps<String>.menu(
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: livelihood_api,
                                  onChanged: (value) {
                                    setState(() {
                                      liveli_list = value;
                                      FetchLivelihood_sub_Api(liveli_list!);
                                    });
                                  },
                                  // selectedItem: 'Livelihood',
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: 'Livelihood',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * .8,
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps<String>.menu(
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: Livelihood_sublistlist,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        liveli_sublist = value;
                                      },
                                    );
                                  },
                                  selectedItem: 'Livelihood Sublist',
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              try {
                                livelihoodApi(
                                    panchayth!, liveli_list!, liveli_sublist);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please provide data!'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.download))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
