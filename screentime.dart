import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:margdarshakapi/scan.dart';

class ScreenTime extends StatefulWidget {
  final String title;
  const ScreenTime({Key? key, required this.title}) : super(key: key);

  @override
  _ScreenTimeState createState() => _ScreenTimeState();
}

class _ScreenTimeState extends State<ScreenTime> {
  // Future<List<Application>> apps = DeviceApps.getInstalledApplications(includeSystemApps: false);

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
    child: ListView(
      children:[Table(
    defaultColumnWidth: FixedColumnWidth(120.0),

    border: TableBorder.all(
    color: Colors.white,
    style: BorderStyle.solid,
    width: 2),
    children: [
    TableRow( children: [
    Container(height: 65,padding:EdgeInsets.only(
        top:17),color: Color(0xff0307f2),child:Column(children:[Text('App Icon', style: TextStyle(fontSize: 20.0, color: Colors.white))], ),),
      Container(height: 65,padding:EdgeInsets.only(
          top:17),color: Color(0xff0307f2),child:Column(children:[Text('App Name', style: TextStyle(fontSize: 20.0, color: Colors.white))]),),
      Container(height: 65,padding:EdgeInsets.only(
          top:17),color:Color(0xff0307f2), child:Column(children:[Text('Screen Time', style: TextStyle(fontSize: 20.0, color: Colors.white))]),),
    ])]),

    FutureBuilder<List>(
          future: getApps(),
    builder:(context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
    } else {
    return ListView.builder(

      controller: ScrollController(),
      shrinkWrap: true,
      scrollDirection:Axis.vertical,
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
        print('${snapshot.data[index]}'+"\n");
      Uint8List x = snapshot.data[index].icon;
      double st=((snapshot.data[index].updateTimeMillis)/1000);
      return Container(padding:EdgeInsets.all(5),child:Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

        Container(height: 105, width: 125,
            padding: EdgeInsets.only(
                top: 17),
            color: Color(0xff0307f2),
            child: Column(children: [ Image.memory(
              x,
              height: 50,
              width: 50,

            )
            ],)),
      Flexible(
        child:Container(
          margin: EdgeInsets.all(3),
          color: Color(0xff9799fc),
          height: 105, width: 130,
          padding: EdgeInsets.all(20),

          child:
            Text('${snapshot.data[index].appName}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.black))
          ),),
            Flexible(
              child:Container(
                  margin: EdgeInsets.all(3),
                  color: Color(0xff9799fc),
                  height: 105, width: 130,
                  padding: EdgeInsets.all(20),

                  child:
                  Text(st.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.black))
              ),)

        //   Container(height: 65,padding:EdgeInsets.only(
        //       top:17),color:Color(0xff0307f2), child:Column(children:[Text('Screen Time', style: TextStyle(fontSize: 20.0, color: Colors.white))]),),
        // ])


      // return Row(
      //
      //     children:[
      //        Image.memory(
      //            x,
      //          height: 50,
      //          width: 50,
      //
      //        ),
      //       Text('${snapshot.data[index]}'),]);
      // }
      ]));}
    );
    }
    }

      ),
    ]))

    );


  }

Future<List> getApps() async{
 Future<List> x= DeviceApps.getInstalledApplications(includeSystemApps: true, includeAppIcons: true);
 return x;
}


}
