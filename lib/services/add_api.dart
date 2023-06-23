import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/add_model.dart';

Future<Map<String, dynamic>> postData(AddData data) async {
  const apiUrl = 'http://localhost:5000/api/user/insert'; // Replace with your API endpoint

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data.toJson()),
  );

  final jsonResponse = response.body.isNotEmpty ? json.decode(response.body) : null;
  return jsonResponse;
}
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../model/add_model.dart';
//
// // Function to connect UI, model, and API
// Future<void> connectWithUiModelAndApi(AddData addData) async {
//   try {
//     String jsonData = addDataToJson(addData);
//
//     var response = await http.post(
//       Uri.parse('http://localhost:5000/api/user/insert'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonData,
//     );
//
//     if (response.statusCode == 200) {
//       print('Data submitted successfully!');
//     } else {
//       print('Error submitting data. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception occurred: $e');
//   }
// }
