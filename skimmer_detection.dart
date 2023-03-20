import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:margdarshakapi/scan.dart';

class SkimmerDet extends StatefulWidget {
  final String title;
  const SkimmerDet({Key? key, required this.title}) : super(key: key);

  @override
  _SkimmerDetState createState() => _SkimmerDetState();
}

class _SkimmerDetState extends State<SkimmerDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          // leading: new IconButton(
          //   icon: new Icon(Icons.menu, color: Colors.white),
          //   onPressed: () {},
          // ),
        ),
        // ),

        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "What is Skimming?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff000289),
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2020/07/credit-card-skimming-1595241160.jpg",
                ),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Skimming is a type of attack where a malicious device or mechanism is inserted at the point of a legitimate transaction to capture card details. It is a man-in-the-middle attack. In the physical world, skimming devices are attached to the card slot of ATMs or gas pump payment terminals to capture the data encoded on the card's magnetic stripe. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scan()));
                  },
                  child: Text(
                    "Start Scan",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff1e1e1e)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ))
              // Image.asset(
              //   "images/skimmerdetector.gif",
              //   height: 550.0,
              //   width: 550.0,
              // ),
            ])));
  }
}
