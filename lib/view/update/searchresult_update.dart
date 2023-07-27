
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updatepersonal_add.dart';
import '../../services/add_api.dart';
import '../login.dart';
import 'package:http/http.dart' as http;

class SerachresultUpsate extends StatefulWidget {
  const SerachresultUpsate({Key? key, this.item,}) : super(key: key);
final List<dynamic>? item;
  @override
  State<SerachresultUpsate> createState() => _SerachresultUpsateState();
}

class _SerachresultUpsateState extends State<SerachresultUpsate> {

  Future<void> deleteDataonId(String dataId, String token) async {
    final apiUrl = '${api}search/deleteById?dataId=$dataId';
    print(dataId);

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token'
        }, // Pass the token in the request headers
      );
      print(response.body.toString());
      if (response.statusCode == 200) {
        print('Data deletion successful');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Data deletion successful!'),
          ),
        );

      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred during data deletion: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('വ്യക്തികളുടെ ലിസ്റ്റ് '),
          backgroundColor: app_theam,
        ),
        body: ListView.builder(
          itemCount: widget.item!.length,
          itemBuilder: (context, index) { Map<String, dynamic> data = widget.item![index]['data'][0];
            print(data);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePersonalPage(items: widget.item![index],),));
                },
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(Icons.person,size: 50,color: app_theam,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name  : ${data['data_Name']}',style: adj,overflow: TextOverflow.ellipsis,),
                              Text('Phone : ${data['data_Phonenumber']}',style: adj,overflow: TextOverflow.ellipsis,),
                              Text('Group : ${data['data_NameofNG']}',style: adj,overflow: TextOverflow.ellipsis,),
                              // Text('Group : ${data['data_NameofNG']}',style: adj,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Confirmation'),
                                content: Text('Do you want to delete?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel',style: TextStyle(color: Colors.green)),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text('OK',style: TextStyle(color: Colors.red),),
                                    onPressed: () {
                                      var id = widget.item![index]['data'][0]['_id'];
                                      print(id);
                                      deleteDataonId(id, authToken!);
                                      // Perform delete operation
                                      // Add your delete logic here
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete,color: Colors.red,),
                      )
                    ],
                  ),
                ),
              ),
            );
        },),
      ),
    );
  }
}
