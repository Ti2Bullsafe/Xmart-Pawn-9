import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double deviceHeight(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery?.size.height ?? 0.0;
}
double deviceWidth(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery?.size.width ?? 0.0;}

String administratorDefaultKey = "888888";
String userDefaultKey = "123456";
String userDefaultId="1";
String validateUserComplete = "VALIDATE_USER_COMPLETE";
String boxGateDefaultData ='{"cerradura": "Cerrada", "puerta": "Cerrada", "ultimaApertura": "02/08/2023 01:20 p.m.", "duracion": "","codigoCierre":"","estado":"seguro"}';
String drawersDefaultData ='{"cerradura": "Cerrada", "ultimoCajonAbierto": "", "ultimaApertura": "02/08/2023 01:20 p.m.", "duracion": "","codigoCierre":"","estado":"seguro"}';

saveDataToCache(String key, dynamic value ) async {
  final prefs = await SharedPreferences.getInstance();
  if(value is String) {
    prefs.setString(key, value );
  }
  if(value is int){
    prefs.setInt(key, value);
  }
  if(value is bool){
    prefs.setBool(key, value);
  }
  if(value is double ){
    prefs.setDouble(key, value);
  }
  if(value is List<String>){
    prefs.setStringList(key, value);
  }
}

dynamic readDataFromCache(String key) async {
  final prefs = await SharedPreferences.getInstance();
  dynamic data = prefs.get(key);
  return data ?? "NOT_FOUND";
}


String getDayName(DateTime dateTime) {
  switch (dateTime.weekday) {
    case 1:
      return 'Lunes';
    case 2:
      return 'Martes';
    case 3:
      return 'Miércoles';
    case 4:
      return 'Jueves';
    case 5:
      return 'Viernes';
    case 6:
      return 'Sábado';
    case 7:
      return 'Domingo';
    default:
      return 'Día inválido';
  }
}

String getMonthName(DateTime dateTime) {
  switch (dateTime.month) {
    case 1:
      return 'Enero';
    case 2:
      return 'Febrero';
    case 3:
      return 'Marzo';
    case 4:
      return 'Abril';
    case 5:
      return 'Mayo';
    case 6:
      return 'Junio';
    case 7:
      return 'Julio';
    case 8:
      return 'Agosto';
    case 9:
      return 'Septiembre';
    case 10:
      return 'Octubre';
    case 11:
      return 'Noviembre';
    case 12:
      return 'Diciembre';
    default:
      return 'Mes inválido';
  }
}