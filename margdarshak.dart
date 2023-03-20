import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MargDarshak extends StatefulWidget {
  final String title;
  const MargDarshak({Key? key, required this.title}) : super(key: key);

  @override
  _MargDarshakState createState() => _MargDarshakState();
}

class _MargDarshakState extends State<MargDarshak> {
  Color col = Colors.green;
  String myres = "-";
  final myController = TextEditingController();
  final url = "https://vulnerabilityassessmenttool.com/predict";
  void postData() async {
    try {
      final response =
          await http.post(Uri.parse(url), body: {"url": myController.text});
      String x = response.body.toString();

      int sind = x.indexOf(
          "<h3 class=\"u-align-center u-text u-text-default-lg u-text-default-md u-text-default-sm u-text-default-xl u-text-palette-1-dark-2 u-text-2\">");
      int eind = x.indexOf(
          "<a href=\"/\" class=\"u-border-2 u-border-custom-color-3 u-btn u-btn-round u-button-style u-custom-color-4 u-hover-palette-1-light-1 u-radius-6 u-text-white u-btn-1\">");
      final respo = x.substring(sind, eind);
      String temp = respo.replaceAll(
          "<h3 class=\"u-align-center u-text u-text-default-lg u-text-default-md u-text-default-sm u-text-default-xl u-text-palette-1-dark-2 u-text-2\">",
          "");
      String last = temp.replaceAll("</h3>", "");
      setState(() {
        myres = last;
        if (myres.contains("Wrong") == true) {
          col = Colors.red;
        } else {
          col = Colors.green;
        }
      });
      print(respo);
    } catch (er) {
      print(er);
    }
  }

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
          child: Column(
            children: [
              Text(
                "Why MargDarshak?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff000289),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Phishers try to deceive their victims by social engineering or creating mockup websites to steal information such as account ID, username, password from individuals and organizations. That's why we build MargDarshak, that can help you detect whether the URL you were about to click on is a phishing URL or not.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )),
              SizedBox(height: 50),
              Text(
                "Paste your URL here:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000289),
                    fontSize: 20),
              ),
              SizedBox(height: 20),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'URL for detection',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      myres = "";
                    });
                    postData();
                  },
                  child: Text(
                    "Detect",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff1e1e1e)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  )),
              Container(
                  padding: EdgeInsets.all(15),
                  child: myres == ""
                      ? CircularProgressIndicator()
                      : Text(
                          myres,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: col,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
            ],
          )),
    );
  }
}
