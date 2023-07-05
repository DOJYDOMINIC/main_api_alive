// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:intl/intl.dart';
// import '../../services/add_api.dart';
//
// class DownloadingDialog extends StatefulWidget {
//   const DownloadingDialog({Key? key}) : super(key: key);
//
//   @override
//   _DownloadingDialogState createState() => _DownloadingDialogState();
// }
//
// class _DownloadingDialogState extends State<DownloadingDialog> {
//   Dio dio = Dio();
//   double progress = 0.0;
//
//   Future<void> startDownloading() async {
//     const String url =
//         '${api}search/class1?data_Panchayath=Pavithreswaram_&data_Class=APL';
//
//     String timeStamp = DateFormat("yyyyMMdd_HHmmss").format(DateTime.now());
//     String fileName = "data_${timeStamp}.xlsx";
//
//     String path = await _getFilePath(fileName);
//     print('Download Path: $path');
//
//     // Check if the storage permission is granted
//     if (await Permission.storage.isGranted) {
//       // Permission is granted, proceed with the download
//       try {
//         await dio.download(
//           url,
//           path,
//           onReceiveProgress: (receivedBytes, totalBytes) {
//             setState(() {
//               progress = receivedBytes / totalBytes;
//             });
//             print(progress);
//           },
//           deleteOnError: true,
//         );
//       } catch (e) {
//         // Handle the error here (e.g., show an error message).
//         print("Error while downloading: $e");
//       }
//     } else {
//       // Permission is not granted, request the storage permission
//       var status = await Permission.storage.request();
//       if (status.isGranted) {
//         // Permission granted by the user, start the download
//         await startDownloading();
//       } else if (status.isPermanentlyDenied) {
//         // Permission permanently denied, show a dialog to open app settings
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Permission Required'),
//               content: const Text(
//                   'Please grant storage permission in app settings to continue.'),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('Open Settings'),
//                   onPressed: () {
//                     openAppSettings();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('Cancel'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     Navigator.of(context).pop(); // Close the dialog and the downloading dialog
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         // Permission denied by the user, show an error message or handle accordingly
//         print("Permission denied by the user");
//         Navigator.pop(context); // Close the dialog if the download cannot be started
//       }
//     }
//
//     Navigator.pop(context);
//   }
//
//   Future<String> _getFilePath(String filename) async {
//     // final dir = await getApplicationDocumentsDirectory();
//     // ${dir.path}
//     return "/storage/emulated/0/Download/$filename";
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     startDownloading();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String downloadingProgress = (progress * 100).toInt().toString();
//
//     return AlertDialog(
//       backgroundColor: Colors.black,
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const CircularProgressIndicator.adaptive(),
//           const SizedBox(height: 20),
//           Text(
//             "Downloading: $downloadingProgress%",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 17,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
