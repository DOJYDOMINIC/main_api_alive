import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Personalmodel {
  final String dataName;
  final int dataClass;

  Personalmodel({required this.dataName, required this.dataClass});

  factory Personalmodel.fromJson(Map<String, dynamic> json) {
    return Personalmodel(
      dataName: json['dataName'],
      dataClass: json['dataClass'],
    );
  }
}

class PersonalDataFetcher {
  Stream<List<Personalmodel>> fetchPersonalData(
      String panchayath, String dclass, int pageNumber, int count) async* {
    final apiUrl =
        'http://192.168.1.41:5000/api/search/class1?data_Panchayath=$panchayath&data_Class=$dclass&pageNumber=$pageNumber&count=$count';

    while (true) {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final personalData =
        data.map((item) => Personalmodel.fromJson(item)).toList();
        yield personalData;
      } else {
        throw Exception('Failed to fetch personal data');
      }
      await Future.delayed(Duration(seconds: 5)); // Delay between consecutive API calls
    }
  }
}


class New extends StatelessWidget {
  final personalDataFetcher = PersonalDataFetcher();
  final panchayath = 'Panmana_';
  final dclass = 'APL';
  final pageNumber = 1;
  final count = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Data',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Data'),
        ),
        body: StreamBuilder<List<Personalmodel>>(
          stream: personalDataFetcher.fetchPersonalData(
              panchayath, dclass, pageNumber, count),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final personalData = snapshot.data!;
              return Container(
                height: 250,
                child: ListView.builder(
                  itemCount: personalData.length,
                  itemBuilder: (context, index) {
                    final datum = personalData[index];
                    return ListTile(
                      title: Text(datum.dataName),
                      subtitle: Text(datum.dataClass.toString()),
                    );
                  },
                ),
              );
            } else {
              return Text('No personal data available');
            }
          },
        ),
      ),
    );
  }
}
