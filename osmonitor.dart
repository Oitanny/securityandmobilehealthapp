import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:core';
import 'package:disk_space/disk_space.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:disk_space/disk_space.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:margdarshakapi/device_info.dart';
import 'package:margdarshakapi/main.dart';
import 'package:margdarshakapi/whoisosm.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:math';

class OSM extends StatefulWidget {
  @override
  _OSMState createState() => _OSMState();
}

class _OSMState extends State<OSM> {
  Random random = new Random();

  static String? conn;
  static int? sizeofnetws;
  List<Application> xi = [];
  static double? fd, td;
  String selected = "proc";
  String selectedpage = "process";
  Color p = Colors.purple;
  Color n = Color(0xff000289);
  Color c = Color(0xff000289);
  Color m = Color(0xff000289);

  @override
  void initState() {
    // TODO: implement initState
    getconnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("OS Monitor"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyApp()));
            },
            icon: Icon(Icons.arrow_back),
            //replace with our own icon data.
          ),
          // leading: new IconButton(
          //   icon: new Icon(Icons.menu, color: Colors.white),
          //   onPressed: () {},
          // ),
        ),
        // ),

        body: Container(
            padding: EdgeInsets.all(5),

            child: ListView(children: [
              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(2),

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = "proc";
                              selectedpage = "process";
                              p = Colors.purple;
                              n = Color(0xff000289);
                              c = Color(0xff000289);
                              m = Color(0xff000289);
                            });
                          },
                          style: ElevatedButton.styleFrom(

                            primary: p,
                          ),
                          child: Padding(padding: EdgeInsets.all(3),
                              child: Column(

                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset( // <-- Icon
                                    "images/process.png",
                                    height: 50,
                                    width: 50,
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text('Process'), //
                                ],
                              )),
                        )),
                    Padding(padding: EdgeInsets.all(2),

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = "net";
                              selectedpage = "network";
                              n = Colors.purple;
                              p = Color(0xff000289);
                              c = Color(0xff000289);
                              m = Color(0xff000289);
                            });
                          },
                          style: ElevatedButton.styleFrom(

                            primary: n,
                          ),
                          child: Padding(padding: EdgeInsets.all(3),
                              child: Column(

                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset( // <-- Icon
                                    "images/network.jpg",
                                    height: 50,
                                    width: 50,
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text('Network'), //
                                ],
                              )),
                        )),
                    Padding(padding: EdgeInsets.all(2),

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = "con";
                              selectedpage = "connect";
                              c = Colors.purple;
                              n = Color(0xff000289);
                              p = Color(0xff000289);
                              m = Color(0xff000289);
                            });
                          },
                          style: ElevatedButton.styleFrom(

                            primary: c,
                          ),
                          child: Padding(padding: EdgeInsets.all(3),
                              child: Column(

                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset( // <-- Icon
                                    "images/connection.png",
                                    height: 50,
                                    width: 50,
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text('Connection'), //
                                ],
                              )),
                        )),
                    Padding(padding: EdgeInsets.all(2),

                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected = "misc";
                              selectedpage = "miscll";
                              m = Colors.purple;
                              n = Color(0xff000289);
                              c = Color(0xff000289);
                              p = Color(0xff000289);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DeviceInfoPage()));
                            });
                          },
                          style: ElevatedButton.styleFrom(

                            primary: m,
                          ),
                          child: Padding(padding: EdgeInsets.all(4),
                              child: Column(

                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset( // <-- Icon
                                    "images/misc.png",
                                    height: 50,
                                    width: 50,
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),

                                  Text('Misc'), //
                                ],
                              )),
                        )),


                  ]),

              if(selected == "proc" && selectedpage == "process")

                Column(

                    children: [

                      FutureBuilder(
                          future: getTotalDiskSpaceInfo(),
                          builder: (BuildContext context, AsyncSnapshot text) {
                            return Container(
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.all(3),
                                color: Colors.blueGrey,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 20,
                                child: Column(

                                  children: [Text("Memory Space Total: " +
                                      text.data.toString())
                                  ],
                                )
                            );
                          }),
                      FutureBuilder(
                          future: getFreeDiskSpaceInfo(),
                          builder: (BuildContext context, AsyncSnapshot text) {
                            return Container(
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.all(3),
                                color: Colors.blueGrey,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 20,
                                child: Column(

                                  children: [Text("Memory Space Free: " +
                                      text.data.toString()),
                                  ],
                                )
                            );
                          }),

                      //  Container(
                      //    margin: EdgeInsets.all(3),
                      //     padding: EdgeInsets.all(3),
                      //     color: Colors.blueGrey,
                      //     width: MediaQuery.of(context).size.width-20 ,
                      //     child:Column(
                      //
                      //       children: [Text("Memory Space Total: "+td.toString()),Text("Memory Space Free: "+fd.toString())],
                      //     )
                      // ),
                      Row(children: [

                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.only(
                              top: 17),
                          color: Color(0xff0307f2),
                          child: Column(
                            children: [Text('Process Id', style: TextStyle(
                                fontSize: 20.0, color: Colors.white))
                            ],),),
                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.only(
                              top: 17),
                          color: Color(0xff0307f2),
                          child: Column(
                              children: [Text('Name', style: TextStyle(
                                  fontSize: 20.0, color: Colors.white))
                              ]),),
                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.only(
                              top: 17),
                          color: Color(0xff0307f2),
                          child: Column(
                              children: [Text('Load', style: TextStyle(
                                  fontSize: 20.0, color: Colors.white))
                              ]),),
                      ]),


                      FutureBuilder<List>(
                          future: getApps(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData == false) {
                              print(snapshot.data);
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(

                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    print("\n-----------" +
                                        Platform.numberOfProcessors.toString() +
                                        "\n\n");
                                    print('${snapshot.data[index]}' + "\n");
                                    // Uint8List x = snapshot.data[index].icon;
                                    double st = 0.0 +
                                        Random().nextInt((7 + 1) - 0);
                                    return Container(
                                        padding: EdgeInsets.all(5), child: Row(

                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [

                                          Container(height: 105,
                                              width: 125,
                                              padding: EdgeInsets.only(
                                                  top: 17),
                                              color: Color(0xff0307f2),
                                              child: Column(children: [
                                                Text("App " +
                                                    (index + 1).toString())
                                                //   Image.memory(
                                                //   x,
                                                //   height: 50,
                                                //   width: 50,
                                                //
                                                // )
                                              ],)),
                                          Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(3),
                                                color: Color(0xff9799fc),
                                                height: 105,
                                                width: 130,
                                                padding: EdgeInsets.all(20),

                                                child:
                                                Text('${snapshot.data[index]
                                                    .appName}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.black))
                                            ),),
                                          Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(3),
                                                color: Color(0xff9799fc),
                                                height: 105,
                                                width: 130,
                                                padding: EdgeInsets.all(20),

                                                child:
                                                Text(st.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.black))
                                            ),)


                                        ]));
                                  }
                              );
                            }
                          }
                      ),

                    ]),

              if(selected == "net" && selectedpage == "network")
                Column(

                    children: [
                      if(sizeofnetws == 0)
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                children: [
                                  Icon(
                                    Icons.wifi_off_outlined,
                                    color: Colors.red,
                                  ),
                                  Padding(padding: EdgeInsets.all(20),
                                      child: Align(
                                          alignment: Alignment.topLeft,

                                          child: Text(
                                            "No Network Detected",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 18,

                                            ),
                                          ))),
                                ]

                            ))
                      else
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                children: [
                                  Icon(
                                    Icons.network_wifi,
                                    color: Colors.green,
                                    size: 50,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          20, 40, 20, 40),
                                      child:
                                      // Align(
                                      //     alignment: Alignment.topLeft,
                                      //
                                      //     child:
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 7),
                                              child: Text(
                                                "Status: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0307f2),
                                                    fontSize: 22
                                                ),
                                              )),
                                          Text(
                                            "Connected",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 22
                                            ),
                                          )

                                        ],)),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          20, 0, 20, 40),
                                      child:
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 7),
                                              child: Text(
                                                "Type of Network: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0307f2),
                                                    fontSize: 22
                                                ),
                                              )),
                                          Text(
                                            "$conn",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 22
                                            ),
                                          )

                                        ],)),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                                    child:
                                    FutureBuilder(
                                        future: getIPAddress(),
                                        initialData: "Loading...",
                                        builder: (BuildContext context,
                                            AsyncSnapshot<String?> text) {
                                          return Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 7),
                                                  child: Text(
                                                    "IP address: ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: Color(
                                                            0xff0307f2),
                                                        fontSize: 22
                                                    ),
                                                  )),
                                              Text(
                                                text.data.toString(),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 22
                                                ),
                                              ),


                                            ],);
                                        }),
                                  ),
                                  SizedBox(height:40),
                                  ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WHOis()));
                                      },
                                      child: Text(
                                          "Get more info on WhoIS",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                      )
                                  )

                                  //)
                                ]

                            ))

                    ]),
              if(selected == "con" && selectedpage == "connect")
                Column(

                    children: [
                      Row(children: [
                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.all(5),
                          color: Color(0xff0307f2),
                          child: Column(
                            children: [Text('Interface', textAlign: TextAlign
                                .center, style: TextStyle(
                                fontSize: 20.0, color: Colors.white))
                            ],),),
                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.all(5),
                          color: Color(0xff0307f2),
                          child: Column(children: [
                            Text('Local/Remote IP', textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white))
                          ]),),
                        Container(margin: EdgeInsets.all(1),
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.all(5),
                          color: Color(0xff0307f2),
                          child: Column(
                              children: [Text('Type', textAlign: TextAlign
                                  .center, style: TextStyle(
                                  fontSize: 20.0, color: Colors.white))
                              ]),),
                      ]),

                      FutureBuilder<List>(
                          future: getIps(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(

                                  controller: ScrollController(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context,
                                      int index) {
// print(snapshot.data[index].addresses[0].address);
                                    String st = '${snapshot.data[index].name}';
                                    if (st.contains("eth")) {
                                      st = "Ethernet";
                                    } else if (st.contains("wlan")) {
                                      st = "WLAN";
                                    }
                                    return Container(
                                        padding: EdgeInsets.all(5), child: Row(

                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [

                                          Flexible(
                                              child: Container(
                                                  margin: EdgeInsets.all(3),
                                                  color: Color(0xff9799fc),
                                                  height: 105,
                                                  width: 130,
                                                  padding: EdgeInsets.all(20),

                                                  child:
                                                  Text(st,
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.black))
                                              )),
                                          Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(3),
                                                color: Color(0xff9799fc),
                                                height: 105,
                                                width: 130,
                                                padding: EdgeInsets.all(20),

                                                child:
                                                Text('${snapshot.data[index]
                                                    .addresses[0].address}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.black))
                                            ),),
                                          Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(3),
                                                color: Color(0xff9799fc),
                                                height: 105,
                                                width: 130,
                                                padding: EdgeInsets.all(20),

                                                child:
                                                Text(
                                                    '${snapshot.data[index]
                                                        .addresses[0].type
                                                        .name}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.black))
                                            ),)


                                        ]));
                                  }
                              );
                            }
                          }
                      ),
                    ]),

            ])));
  }

  static Future<List> getApps() async {
    Future<List> x = DeviceApps.getInstalledApplications(
        includeSystemApps: true, includeAppIcons: true);

    return x;
  }

  // Future<void> scanNetwork() async {
  //   await (NetworkInfo().getWifiIP()).then(
  //         (ip) async {
  //       final String subnet = ip!.substring(0, ip.lastIndexOf('.'));
  //       const port = 22;
  //       for (var i = 0; i < 256; i++) {
  //         String ip = '$subnet.$i';
  //         await Socket.connect(ip, port, timeout: Duration(milliseconds: 50))
  //             .then((socket) async {
  //           await InternetAddress(socket.address.address)
  //               .reverse()
  //               .then((value) {
  //             print(value.host);
  //             print(socket.address.address);
  //           }).catchError((error) {
  //             print(socket.address.address);
  //             print('Error: $error');
  //           });
  //           socket.destroy();
  //         }).catchError((error) => null);
  //       }
  //     },
  //   );
  //   print('Done');}
  static Future<List> getIps() async {
    List<NetworkInterface> c = await NetworkInterface.list();
    sizeofnetws = c.length;
    return await NetworkInterface.list();
  }

  //){
  // print('== Interface: ${interface.name} ==');
  // for (var addr in interface.addresses) {
  //  return addr;
  // print(
  //     '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');

  Future<double?> getFreeDiskSpaceInfo() async {
    return await DiskSpace.getFreeDiskSpace;

    Future<double?> y = DiskSpace.getTotalDiskSpace;

    //
    // td=y;
  }

  Future<double?> getTotalDiskSpaceInfo() async {
    return await DiskSpace.getTotalDiskSpace;

    Future<double?> y = DiskSpace.getTotalDiskSpace;

    //
    // td=y;
  }

  static void getconnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult.toString() + " :\n");
    if (connectivityResult == ConnectivityResult.mobile) {
      conn = "Mobile Data";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      conn = "WiFi";
    }
  }

  Future<String?> getIPAddress() async {
    final _deviceInfoPlugin = DeviceInfoPlugin();
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }
}


// class NetworkStat extends StatefulWidget {
//   @override
//   _NetworkStatState createState() => _NetworkStatState();
// }
// class _NetworkStatState extends State<NetworkStat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text("OS Monitor"),
//     // leading: new IconButton(
//     //   icon: new Icon(Icons.menu, color: Colors.white),
//     //   onPressed: () {},
//     // ),
//     ),
//     // ),
//
//     body: Container(

