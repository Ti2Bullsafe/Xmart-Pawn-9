import 'dart:async';

import 'package:flutter/material.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';

import '../../entities/pantalla_principal/pantalla_principal_routes.dart';
import '../../keys.dart';
class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return _LoadScreenState();
  }
}

class _LoadScreenState extends StatefulWidget {
  _LoadScreenState({Key? key}) : super(key: JhipsterFlutterSampleAppKeys.mainScreen);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_LoadScreenState>  with SingleTickerProviderStateMixin{
  AnimationController? _iconAnimationController;
  Animation<double>? _iconAnimation;
  // PermissionStatus? _status;
  int permision=0;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController!,
      curve: Curves.easeOut,
    );
    _iconAnimation!.addListener(() => this.setState(() {}));
    _iconAnimationController!.forward();
    initializeData();

    getData2();
    // checkAndRequestPermissions();
  }

  // Método para realizar las tareas asíncronas de forma separada.
  Future<void> initializeData() async {
    dynamic administratorKey = await readDataFromCache("administratorKey");
    dynamic userKey = await readDataFromCache("userKey");
    dynamic userId = await readDataFromCache("userId");
    dynamic boxGateDData = await readDataFromCache("boxGateData");
    dynamic drawerData = await readDataFromCache("drawerData");
    if (administratorKey == "NOT_FOUND") {
      administratorKey = saveDataToCache("administratorKey", administratorDefaultKey);
      print("administratorDefaultKey guardado");
    }
    if (userKey == "NOT_FOUND") {
      userKey = saveDataToCache("userKey", userDefaultKey);
      print("userKey guardado");
    }
    if (userId == "NOT_FOUND") {
      userId = saveDataToCache("userId", userDefaultId);
      print("userId guardado");
    }
    if(boxGateDData =="NOT_FOUND"){
      boxGateDData = saveDataToCache("boxGateData", boxGateDefaultData);
    }
    if(drawerData =="NOT_FOUND"){
      drawerData = saveDataToCache("drawersData", drawersDefaultData);
    }
  }

  // Future<void> checkAndRequestPermissions() async {
  //   if (await Permission.camera.status != PermissionStatus.granted) {
  //     await Permission.camera.request();
  //   }
  //   if (await Permission.microphone.status != PermissionStatus.granted) {
  //     await Permission.microphone.request();
  //   }
  //   if (await Permission.storage.status != PermissionStatus.granted) {
  //     await Permission.storage.request();
  //   }
  // }

  getData2() async {
    Timer(const Duration(seconds: 4),
        () => {Navigator.pushNamed(context, PantallaPrincipalRoutes.view)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
              color: Colors.black87,
        ),
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Hero(
              tag: 'hero',
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                child: Container(
                  width:_iconAnimation!.value*190,
                  height: _iconAnimation!.value*100,
                  child:
                    Image.asset(
                      'assets/logos/bull_saffe_blanco.png',
                    ),)
              ),
            ),


            const Padding(padding: EdgeInsets.only(top: 200.0),),

            CircularProgressIndicator(color: Colors.white,),
            const Padding(padding: EdgeInsets.only(top: 8.0),),

            const Text(
              'Bull Safe',style: TextStyle(color: Colors.white,fontSize: 20),
            ),
            const Text(
              'versión 1.0.2',style: TextStyle(color: Colors.white,fontSize: 20),
            ),

          ],
        ),

      ),)
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}