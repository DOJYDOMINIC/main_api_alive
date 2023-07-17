import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';



//base URL

const api = 'http://192.168.1.46:5000/api/';



Future<void> postData(AddData addData) async {
  const apiUrl = '${api}user/insert'; // Replace with your API endpoint

  final headers = {
    'Content-Type': 'application/json',
    // Add any additional headers if required
  };

  final jsonBody = json.encode(addData.toJson());

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonBody);

  if (response.statusCode == 200) {
    print(response);

    // Post request was successful

    print('Data posted successfully');
  } else {
    // Error occurred during the post request
    print('Error: ${response.statusCode}');
  }
}
