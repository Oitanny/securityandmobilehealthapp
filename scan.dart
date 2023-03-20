import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Skimmer detector"),
          // leading: new IconButton(
          //   icon: new Icon(Icons.menu, color: Colors.white),
          //   onPressed: () {},
          // ),
        ),
        // ),

        body: Container(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "images/skimmerdetector.gif",
                height: 450,
                width: 450,
              ),
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Scanning",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000289),
                    ),
                  ),
                ),
                CircularProgressIndicator(),
              ]),
            ),
          ]),
        ));
  }
}
