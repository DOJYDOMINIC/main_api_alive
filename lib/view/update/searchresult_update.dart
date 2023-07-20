
import 'package:flutter/material.dart';
import 'package:main200623/constant/color_text.dart';
import 'package:main200623/view/update/updatepersonal_add.dart';
import '../login.dart';

class SerachresultUpsate extends StatefulWidget {
  const SerachresultUpsate({Key? key, this.item,}) : super(key: key);
final List<dynamic>? item;
  @override
  State<SerachresultUpsate> createState() => _SerachresultUpsateState();
}

class _SerachresultUpsateState extends State<SerachresultUpsate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('വ്യക്തികളുടെ ലിസ്റ്റ് '),
        backgroundColor: app_theam,
      ),
      body: ListView.builder(
        itemCount: widget.item!.length,
        itemBuilder: (context, index) { Map<String, dynamic> data = widget.item![index]['data'][0];
          // String dataName = data['data_Name'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                print(authToken);
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePersonalPage(items: widget.item![index],),));
                print(data['_id']);
              },
              child: Container(
                width: 250,
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
                            Text('Group : ${data['_id']}',style: adj,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      },),
    );
  }
}
