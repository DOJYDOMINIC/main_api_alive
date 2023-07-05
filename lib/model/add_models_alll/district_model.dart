// // To parse this JSON data, do
// //
// //     final registration = registrationFromJson(jsonString);
//
// import 'dart:convert';
//
// Registration registrationFromJson(String str) => Registration.fromJson(json.decode(str));
//
// String registrationToJson(Registration data) => json.encode(data.toJson());
//
// class Registration {
//   List<String> district;
//
//   Registration({
//     required this.district,
//   });
//
//   factory Registration.fromJson(Map<String, dynamic> json) => Registration(
//     district: List<String>.from(json["district"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "district": List<dynamic>.from(district.map((x) => x)),
//   };
// }
