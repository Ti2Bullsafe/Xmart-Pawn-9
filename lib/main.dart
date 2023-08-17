import 'package:flutter/material.dart';
import 'package:serial_app/app.dart';
import 'package:serial_app/environment.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;


void main() {
  Constants.setEnvironment(Environment.DEV);
  initializeJsonMapper();
  runApp(JhipsterFlutterSampleAppApp());
}

