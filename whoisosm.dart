import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class WHOis extends StatefulWidget {
  @override
  _WHOisState createState() => _WHOisState();
}

class _WHOisState extends State<WHOis> {
  var ip;
  var url_;
  final myController = TextEditingController();
  void initState() {
    // TODO: implement initState
    getIPAddress();
    postData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading:
          new IconButton(
            icon: new Icon(Icons.arrow_left_sharp,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          foregroundColor: Color(0xFF02ffb1),
          backgroundColor: Color(0xFF03123d), //
          elevation: 0,
          // <-- SEE HERE
        ),

        body:FutureBuilder(
        future: postData(),
    builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.hasData == false) {

    return Center(child: CircularProgressIndicator());
    } else {
      var x=Map<String, dynamic>.from(snapshot.data);
      print(x);
      return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF03123d),
                  Color(0xFF12115e),
                  Color(0xFF4b0bdc),

                ],
              )
          ),
          child:

          ListView(
            controller: ScrollController(),
            children: [
              Expanded(child:
              Container(

                height: (MediaQuery.of(context).size.height)/2-10,
                width: (MediaQuery.of(context).size.width),
      child:Scrollbar(
          thickness: 10,
          radius: const Radius.circular(10),
                child:ListView(

                  children: [
                    Row(
                      children: [
                        Text("Who",
                        style:GoogleFonts.oswald(
                          letterSpacing: 2,
                          textStyle:

                        TextStyle(
                          fontSize:40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          ),
                        )),
                      Text("IS",
                          style:GoogleFonts.oswald(
                            letterSpacing: 2,
                            textStyle:
                              TextStyle(
                                  fontSize:40,
                                  color: Colors.white

                              ),
                          )),


                      ],
                    ),
                    Divider(
                        color: Color(0xFF02ffb1),
                      thickness: 2,

                      height: 3,
                    ),
                    //-----------------------------------------------------------------------------Future builder
                    SizedBox(height: 20,),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "ISP: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                        ),
      Flexible(child:
                          Text(
                              "${x["isp"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,

                          ),

                          )),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "IP: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["query"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Country: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["country"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "City: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["city"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Org: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["org"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Latitude: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["lat"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Longitude: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,

                            ),

                          ),
                          Text(
                            "${x["lon"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,

                            ),

                          ),],
                      ),
                    ),

                  ],
                ))
              )),
              Expanded(
                  child:
              Container(
                  height: (MediaQuery.of(context).size.height)/2-10,
                  width: (MediaQuery.of(context).size.width),
    child:Scrollbar(
    thickness: 10,
    radius: const Radius.circular(10),
                  child:ListView(
                    children: [
                      SizedBox(height: 50,),
                        Center(child: Row(children: [Icon(Icons.map, size: 25,color: Colors.white,),Text("   Map Here :)", style: TextStyle(fontSize: 25, color: Colors.white),)],))
                    ],
                  ))
              )),
            ],
          )
        );}}
    ));
  }
  void getIPAddress() async {
    final _deviceInfoPlugin = DeviceInfoPlugin();
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      setState((){
        ip=response.statusCode == 200 ? response.body : "";
        url_= 'http://ip-api.com/json/$ip?fields=60549115';
        print(url_);
      });
    } catch (e) {
      return null;
    }
  }
  Future postData() async {
    try {
      print("*********************************************************88");
      final response =await http.post(Uri.parse(url_), body: {"url": myController.text});
      var js=  jsonDecode(response.body);
      return js;
    }catch (er) {
      print(er);
    }}
    }