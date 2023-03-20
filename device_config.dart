import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();
  static String? ipAddress,phone,phoneVersion,operatingSystem,screenResolution;
  static Future<String?> getIPAddress() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }

  static Future<String> getOperatingSystem() async => Platform.operatingSystem;

  static Future<String> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {

      final info = await _deviceInfoPlugin.androidInfo;
      return '${info.manufacturer} - ${info.model}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;

      return '${info.name} ${info.model}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String?> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;


      return info.version.sdkInt.toString();

    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion;
    } else {
      throw UnimplementedError();
    }
  }

  static Future<Map<String, dynamic>> getInfo() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfoPlugin.androidInfo;
        ipAddress =  await getIPAddress();
        phone = await getPhoneInfo();
        phoneVersion = await getPhoneVersion();
        operatingSystem = await getOperatingSystem();
        screenResolution = await getScreenResolution();
        return _readAndroidBuildData(info);
      } else if (Platform.isIOS) {
        final info = await _deviceInfoPlugin.iosInfo;
        return _readIosDeviceInfo(info);
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      return <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo info) =>
      <String, dynamic>{
        'Device': info.device,
        'Brand': info.brand,
        'isPhysicalDevice': info.isPhysicalDevice,
        'version.sdkInt': info.version.sdkInt,
        'Manufacturer': info.manufacturer,
        'Model': info.model,
        'IP Address': ipAddress,
        'Phone': phone,
        'Phone OS Version': phoneVersion,
        'Operating System': operatingSystem,
        'Screen Resolution': screenResolution,
        '': '',
        ' ': '',
        'version.securityPatch': info.version.securityPatch,
        'version.release': info.version.release,
        'version.previewSdkInt': info.version.previewSdkInt,
        'version.incremental': info.version.incremental,
        'version.codename': info.version.codename,
        'version.baseOS': info.version.baseOS,
        'Board': info.board,
        'Bootloader': info.bootloader,
        'Display': info.display,
        'Fingerprint': info.fingerprint,
        'Hardware': info.hardware,
        'Host': info.host,
        'Id': info.id,
        'Product': info.product,
        'supported32BitAbis': info.supported32BitAbis,
        'supported64BitAbis': info.supported64BitAbis,
        'supportedAbis': info.supportedAbis,
        'Tags': info.tags,
        'Type': info.type,
        'SystemFeatures': info.systemFeatures,
      };

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo info) =>
      <String, dynamic>{
        'Name': info.name,
        'SystemName': info.systemName,
        'SystemVersion': info.systemVersion,
        'Model': info.model,
        'LocalizedModel': info.localizedModel,
        'IdentifierForVendor': info.identifierForVendor,
        'isPhysicalDevice': info.isPhysicalDevice,
        'utsname.sysname:': info.utsname.sysname,
        'utsname.nodename:': info.utsname.nodename,
        'utsname.release:': info.utsname.release,
        'utsname.version:': info.utsname.version,
        'utsname.machine:': info.utsname.machine,
      };
}

