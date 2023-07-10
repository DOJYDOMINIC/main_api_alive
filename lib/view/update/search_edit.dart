import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/login.dart';
import 'package:main200623/view/update/searchresult_update.dart';
import 'package:main200623/view/widgets/elevate_click_button.dart';
import '../../services/add_api.dart';
import 'package:http/http.dart' as http;
import '../widgets/dropdown_nosearch.dart';

class SearchEdit extends StatefulWidget {
  const SearchEdit({Key? key}) : super(key: key);

  @override
  State<SearchEdit> createState() => _SearchEditState();
}

class _SearchEditState extends State<SearchEdit> {
  String? selectedDistrict;
  String? selectedBlocks;
  String? selectedpanchayth;
  String? selectedcrp;

  @override
  void initState() {
    super.initState();
    fetchDistricts();
  }

  List<String> districts = []; // Declare a global list variable

  Future<void> fetchDistricts() async {
    try {
      final response = await http.get(
        Uri.parse('${api}search/listDistricts'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          districts =
              List<String>.from(data); // Assign fetched data to the global list
          // selectedDistrict;
          // print(selectedDistrict);
        });
      } else {
        throw Exception('Failed to fetch districts');
      }
    } catch (e) {
      // Handle error
      print('Error fetching districts: $e');
    }
  }

  List<String> blocks = [];

  Future<void> fetchBlocks(String selectedDistrict) async {
    try {
      final response = await http.get(
          Uri.parse('${api}search/listBlocks?data_district=$selectedDistrict'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          blocks = List<String>.from(data);
          print(blocks);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  List<String> panchaths = [];

  Future<void> fetchPanchayth(String selectedBlocks) async {
    try {
      final response = await http.get(
          Uri.parse('${api}search/listPanchayats?data_Block=$selectedBlocks'));

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

  List<String> crplist = [];

  Future<void> FetchCrp(String selectedpanchayth) async {
    try {
      final response = await http.get(Uri.parse(
          '${api}search/listCRPNames?data_panchayath=$selectedpanchayth'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          crplist = List<String>.from(data);
          print(crplist);
        });
      } else {
        throw Exception('Failed to fetch blocks');
      }
    } catch (e) {
      // Handle error
      print('Error fetching blocks: $e');
    }
  }

  List? peopledata = [];

  Future<void> Fetchdata(String selectedcrp) async {
    try {
      final response = await http.get(
        Uri.parse('${api}search/searchByCpr?data_nameofcrp=$selectedcrp'),
        headers: {'Authorization': 'Bearer $authToken'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          peopledata = List<Map<String, dynamic>>.from(data);
          print(peopledata);
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SerachresultUpsate(item: peopledata),
          ),
        );
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_theam,
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: app_theam,
                  size: 50,
                ),
                Icon(
                  Icons.search,
                  color: app_theam,
                  size: 50,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            NoSearchDropdown(
              items: districts,
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                  fetchBlocks(selectedDistrict!);
                });
                // providerone.updateDataDistrict(value);
              },
              selecteditem: 'ജില്ല',
            ),
            NoSearchDropdown(
              onChanged: (value) {
                setState(() {
                  selectedBlocks = value;
                  fetchPanchayth(selectedBlocks!);
                });
                // providerone.updateDataBlock(value);
              },
              selecteditem: 'ബ്ലോക്ക്',
              items: blocks,
            ),
            NoSearchDropdown(
                onChanged: (value) {
                  setState(() {
                    selectedpanchayth = value;
                    FetchCrp(selectedpanchayth!);
                  });
                },
                items: panchaths,
                selecteditem: 'പഞ്ചായത്ത്'),
            NoSearchDropdown(
                onChanged: (value) {
                  setState(() {
                    selectedcrp = value;
                    FetchCrp(selectedcrp!);
                  });
                },
                items: crplist,
                selecteditem: 'CRP'),
            ElevateClick(
                ontap: () {
                  Fetchdata(selectedcrp!);
                },
                text: 'Search'),
          ],
        ),
      ),
    );
  }
}
