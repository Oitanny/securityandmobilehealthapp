import 'package:margdarshakapi/osmonitor.dart';

import 'device_config.dart';
import 'info_api.dart';
import 'package:flutter/material.dart';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();

}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OSM()));
        },
        icon:Icon(Icons.arrow_back),
        //replace with our own icon data.
      ),
      title: Text("OS Monitor"),
      centerTitle: true,
    ),
    body: InfoWidget(map: deviceInfo),
  );
}