import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../services/add_api.dart';

class DownloadingDialog extends StatefulWidget {
  const DownloadingDialog({Key? key}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    const String url =
        '${api}search/class1?data_Panchayath=Pavithreswaram_&data_Class=APL';

    const String fileName = "data.xlsx";

    String path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return  AlertDialog(
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
  }
}