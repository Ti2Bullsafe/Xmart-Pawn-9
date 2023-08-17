// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future openLock(BTDeviceStruct deviceInfo) async {
  openCloseLock(deviceInfo, true);
}

Future closeLock(BTDeviceStruct deviceInfo) async {
  openCloseLock(deviceInfo, false);
}

Future<void> openCloseLock(BTDeviceStruct deviceInfo, bool open) async {
  const OPEN_VALUE = [0x02];
  const CLOSE_VALUE = [0X01];
  List<int> action = open ? OPEN_VALUE : CLOSE_VALUE;
  const THIS_SERVICE = "65dc8f2c-e643-4b40-a4ef-acedec4dfe06";
  const String THIS_CHARACTERISTIC = "225164b7-b4e4-4d6e-bc3a-b17e33b64053";
  final device = BluetoothDevice.fromId(deviceInfo.id, name: deviceInfo.name);
  final services = await device.discoverServices();
  BluetoothService openService =
      services.firstWhere((service) => service.uuid.toString() == THIS_SERVICE);
  print(openService);
  BluetoothCharacteristic characteristic = openService.characteristics
      .firstWhere((characteristic) =>
          characteristic.uuid.toString() == THIS_CHARACTERISTIC);
  characteristic.write(action);
  //return true;
}
