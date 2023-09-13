import 'package:flutter/material.dart';
import 'dart:math';

class OddOrEven extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OddOrEvenState();
  }
}

class _OddOrEvenState extends State<OddOrEven> {
  bool accepted = false;
  Color dotColor = Colors.blue;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  int val = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    val = Random().nextInt(100);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      score.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  label: Text(
                    'Player Alpha',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),


            Draggable(
              data: val,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(val.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.pink,
              ),


              feedback: Container(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    'text',
                    // val.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                color: Colors.yellow,
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                  child: DragTarget(
                    builder: (context, List<int?> candidateData, rejectedData) {
                      return Center(
                        child: Text(
                          "Even",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      data as int;
                      if (data % 2 == 0) {
                        setState(() {
                          score++;
                        });
                        if (score >= 3) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Congrats!!"),
                                // content: Text("No-brainer...😮"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text("Ok."),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        score = 0;
                                      });
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                ),

                Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.deepPurple,
                  child: DragTarget(
                    builder: (context, List<int?> candidateData, rejectedData) {
                      return Center(
                        child: Text(
                          "Odd",
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      data as int;
                      if ( data % 2 != 0) {
                        setState(() {
                          score++;
                        });
                        if (score >= 10) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Congrats!!"),
                                content: Text("No-brainer...😮"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: Text("Thanks"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      setState(() {
                                        score = 0;
                                      });
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}





