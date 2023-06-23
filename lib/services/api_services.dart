// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../model/mainmodel.dart';
// import '../model/personal_model.dart';
//
//
// class PersonalDataAPI {
//   static Future<PersonalData> fetchPersonalData(String dataId) async {
//     final url = 'http://192.168.1.41:5000/api/search/searchById?dataId=$dataId';
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       return PersonalData.fromJson(responseData);
//     } else {
//       throw Exception('Failed to fetch personal data. Status code: ${response.statusCode}');
//     }
//   }
// }
//
//
// class DistrictApi {
//   static Future<List<String>> fetchDistricts() async {
//     const url = 'http://192.168.1.41:5000/api/search/listDistricts';
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       final districts = List<String>.from(responseData);
//       return districts;
//     } else {
//       throw Exception('Failed to fetch districts. Status code: ${response.statusCode}');
//     }
//   }
// }
//
// class BlockApi {
//   static Future<List<String>> fetchBlocks(String district) async {
//     final url = 'http://192.168.1.41:5000/api/search/listBlocks?data_district=$district';
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         final blocks = List<String>.from(responseData);
//         return blocks;
//       } else {
//         throw Exception('Failed to fetch blocks. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching blocks: $error');
//       rethrow;
//     }
//   }
// }
//
// class PanchayatApi {
//   static Future<List<String>> fetchPanchayatsByBlock(String block) async {
//     final url = 'http://192.168.1.41:5000/api/search/listPanchayats?data_Block=$block';
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         final panchayats = List<String>.from(responseData);
//         return panchayats;
//       } else {
//         throw Exception('Failed to fetch panchayats. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching panchayats: $error');
//       rethrow;
//     }
//   }
// }
//
// class PersonalDataFetcher {
//
//   Future<Personalmodel> fetchPersonalData(
//       String panchayath, String dclass, int pageNumber, int count) async {
//     final apiUrl =
//         'http://192.168.1.41:5000/api/search/class1?data_Panchayath=$panchayath&data_Class=$dclass&pageNumber=$pageNumber&count=$count';
//
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       return personalmodelFromJson(response.body);
//     } else {
//       throw Exception('Failed to fetch personal data');
//     }
//   }
// }