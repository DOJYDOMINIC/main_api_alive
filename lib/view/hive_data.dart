import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDataListPage extends StatefulWidget {
  @override
  _HiveDataListPageState createState() => _HiveDataListPageState();
}

class _HiveDataListPageState extends State<HiveDataListPage> {
   Box<String>? dataBox; // Use the appropriate data type for your data

  @override
  void initState() {
    super.initState();
    // Initialize Hive and open the box
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    final box = await Hive.openBox<String>('data_box'); // Use the appropriate data type for your data
    setState(() {
      dataBox = box;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Data List'),
      ),
      body: dataBox == null
          ? CircularProgressIndicator() // Show loading indicator until Hive box is opened
          : ListView.builder(
        itemCount: dataBox?.length,
        itemBuilder: (context, index) {
          final key = dataBox?.keyAt(index);
          final value = dataBox?.get(key);
          return ListTile(
            title: Text('Data $key'), // Display data1, data2, etc.
            subtitle: Text(value!),
            // Add more widgets to display other data fields as needed
          );
        },
      ),
    );
  }
}
