import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';
import 'package:serial_app/shared/utilities/modals/bluetooth_configuration_modal.dart';
import 'package:serial_app/shared/utilities/modals/keyboard_modal.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';



class Configuracion extends StatefulWidget {
  const Configuracion({super.key, required this.title});

  final String title;

  @override
  State<Configuracion> createState() => _Configuracion();
}

class _Configuracion extends State<Configuracion> {

  late bool cambiar_clave_administrador = false;
  late bool cambiar_clave_usuario = false;
  late bool bt_vinculado = false;
  late bool sistema_randomico = false;
  late bool fabrica = false;
  late bool back = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              SvgPicture.asset(
                'assets/images/pantalla_abrir_fondo_vertical.svg',
                fit: BoxFit.fill,
                width: (orientation == Orientation.portrait)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.height,
                height: (orientation == Orientation.portrait)
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.width,
              ),
              if (orientation == Orientation.portrait)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            heightFactor: 0.85,
                            child: Stack(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/images/caja_y_logo.svg',
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const FractionallySizedBox(
                                      widthFactor: 0.72,
                                      child: Image(
                                        width: 500,
                                        image: AssetImage('assets/configuration/confiuracion_title.png'),
                                      ),)
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.70,
                                    heightFactor: 0.78,
                                    child: Stack(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/images/marco_botones.svg',
                                          fit: BoxFit.fill,
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top:35,bottom: 25),
                                            alignment: Alignment.bottomCenter,
                                            child:  Column(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                          KeyBoardModal.show(context,titleModal: "NUEVA CLAVE DE ADMINISTRADOR",buttonOrigin: "CAMBIAR_CLAVE_ADMINISTRADOR")
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            cambiar_clave_administrador = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            cambiar_clave_administrador = false;
                                                          });
                                                        },
                                                        child:Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child:   Image(
                                                            image: AssetImage(
                                                                (cambiar_clave_administrador)?'assets/configuration/btn_cambiar_admin_pulsado.png':
                                                                'assets/configuration/btn_cambiar_admin.png'),
                                                          ),
                                                        ))),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          KeyBoardModal.show(context,titleModal: "NUEVA CLAVE DE USUARIO",buttonOrigin: "CAMBIAR_CLAVE_USUARIO")
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            cambiar_clave_usuario = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            cambiar_clave_usuario = false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child:   Image(
                                                            image: AssetImage(
                                                                (cambiar_clave_usuario)?'assets/configuration/btn_cambiar_user_pulsado.png':
                                                                'assets/configuration/btn_cambiar_user.png'),
                                                          ),
                                                        )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          openBluetoothSettings(context)
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            bt_vinculado = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            bt_vinculado = false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child:  Image(
                                                            image: AssetImage(
                                                                (bt_vinculado)?'assets/configuration/btn_bt_pulsado.png':
                                                                'assets/configuration/btn_bt.png'),
                                                          ),
                                                        )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          KeyBoardModal.show(context,titleModal: "INTRODUZCA NUMERO DE SERIE",buttonOrigin: "SISTEMA_RANDOMICO")
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            sistema_randomico = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            sistema_randomico = false;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child:  Image(
                                                            image: AssetImage(
                                                                (sistema_randomico)?'assets/configuration/btn_randomico_pulsado.png':
                                                                'assets/configuration/btn_randomico.png'),
                                                          ),
                                                        )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                          _showDialogImagePicker()
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            fabrica = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            fabrica = false;
                                                          });
                                                        },
                                                        child:Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child:   Image(
                                                            image: AssetImage(
                                                                (fabrica)?'assets/configuration/btn_fabrica_pulsado.png':
                                                                'assets/configuration/btn_fabrica.png'),
                                                          ),
                                                        )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 2,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                          Navigator.of(context).pop()
                                                        },
                                                        child:Container(
                                                          padding: EdgeInsets.only(left: 15,right: 15),
                                                          alignment: Alignment.bottomCenter,
                                                          child: const  Image(
                                                            image: AssetImage('assets/configuration/btn_back.png'),
                                                          ),
                                                        ))
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        )),

                  ],
                )
              else
                //******************************* Pantalla Horizontal [_] ******************************************
                //**************************************************************************************************
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: FractionallySizedBox(
                                widthFactor: 0.85,
                                heightFactor: 0.85,
                                child: Stack(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/images/caja_y_logo.svg',
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      child: const FractionallySizedBox(
                                        widthFactor: 0.72,
                                        child: Image(
                                        width: 500,
                                        image: AssetImage('assets/configuration/confiuracion_title.png'),
                                      ),)
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: FractionallySizedBox(
                                        widthFactor: 0.70,
                                        heightFactor: 0.78,
                                        child: Stack(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'assets/images/marco_botones.svg',
                                              fit: BoxFit.fill,
                                            ),
                                             Container(
                                              padding: EdgeInsets.only(top:35,bottom: 25),
                                              alignment: Alignment.bottomCenter,
                                              child:  Column(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                        KeyBoardModal.show(context,titleModal: "NUEVA CLAVE DE ADMINISTRADOR",buttonOrigin: "CAMBIAR_CLAVE_ADMINISTRADOR")
                                                    },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            cambiar_clave_administrador = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            cambiar_clave_administrador = false;
                                                          });
                                                        },
                                                        child:Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child:  Image(
                                                        image: AssetImage(
                                                            (cambiar_clave_administrador)?'assets/configuration/btn_cambiar_admin_pulsado.png':
                                                            'assets/configuration/btn_cambiar_admin.png'),
                                                      ),
                                                    ))),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          KeyBoardModal.show(context,titleModal: "NUEVA CLAVE DE USUARIO",buttonOrigin: "CAMBIAR_CLAVE_USUARIO")
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            cambiar_clave_usuario = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            cambiar_clave_usuario = false;
                                                          });
                                                        },
                                                        child: Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child: Image(
                                                        image: AssetImage(
                                                            (cambiar_clave_usuario)?'assets/configuration/btn_cambiar_user_pulsado.png':
                                                            'assets/configuration/btn_cambiar_user.png'),
                                                      ),
                                                    )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          openBluetoothSettings(context)
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            bt_vinculado = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            bt_vinculado = false;
                                                          });
                                                        },
                                                        child: Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child:   Image(
                                                        image: AssetImage(
                                                            (bt_vinculado)?'assets/configuration/btn_bt_pulsado.png':
                                                            'assets/configuration/btn_bt.png'),
                                                      ),
                                                    )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:InkWell(
                                                        onTap: ()=>{
                                                          KeyBoardModal.show(context,titleModal: "INTRODUZCA NUMERO DE SERIE",buttonOrigin: "SISTEMA_RANDOMICO")
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            sistema_randomico = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            sistema_randomico = false;
                                                          });
                                                        },
                                                        child: Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child: Image(
                                                        image: AssetImage(
                                                            (sistema_randomico)?'assets/configuration/btn_randomico_pulsado.png':
                                                            'assets/configuration/btn_randomico.png'),
                                                      ),
                                                    )
                                                    )
                                                    ),
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                          _showDialogImagePicker()
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            fabrica = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            fabrica = false;
                                                          });
                                                        },
                                                        child:Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child: Image(
                                                        image: AssetImage(
                                                            (fabrica)?'assets/configuration/btn_fabrica_pulsado.png':
                                                            'assets/configuration/btn_fabrica.png'),
                                                      ),
                                                    )
                                                    )
                                                ),
                                                Expanded(
                                                    flex: 2,
                                                    child: InkWell(
                                                        onTap: ()=>{
                                                          Navigator.of(context).pop()
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            back = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            back = false;
                                                          });
                                                        },
                                                        child:Container(
                                                      padding: EdgeInsets.only(left: 15,right: 15),
                                                      alignment: Alignment.bottomCenter,
                                                      child: Image(
                                                        image: AssetImage(
                                                            (back)?'assets/configuration/btn_regresar_pulsado.png':
                                                            'assets/configuration/btn_back.png'),
                                                      ),
                                                    ))
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                          ],
                        )),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showDialogImagePicker() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ADVERTENCIA'),
          content:  Container(
            child: const Text("¿SEGURO QUE QUIERE RESETEAR A VALORES DE FABRICA?")
            ,),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Continuar'),
              onPressed: () async {
                ressetValues();
                resstetValuesFlushBar();
              }
            ),
          ],
        );
      },
    );
  }


  void ressetValues() {
    saveDataToCache("administratorKey", administratorDefaultKey);
    saveDataToCache("userKey", userDefaultKey);
    saveDataToCache("userId", userDefaultId);
    Navigator.of(context).pop();
  }

  void openBluetoothSettings(BuildContext context) async {
    // Initialize FlutterBlue
    final flutterBlue = FlutterBluePlus.instance;

    // Check if Bluetooth is available on the device
    if (await flutterBlue.isAvailable) {
      // Check if Bluetooth is turned on
      if (await flutterBlue.isOn) {
        // Bluetooth is available and enabled, show the configuration modal
        BluetoothConfigurationModal.show(context,true);
      } else {
        // Bluetooth is not enabled, request to enable it
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Bluetooth Not Enabled'),
              content: Text('Please enable Bluetooth to continue.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await flutterBlue.startScan(allowDuplicates: false);
                  },
                  child: Text('Enable and Scan'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Bluetooth is not available on this device
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Bluetooth Not Available'),
            content: Text('Bluetooth is not supported on this device.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }



resstetValuesFlushBar(){
    return Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      positionOffset: 70,
      margin: const EdgeInsets.only(bottom: 10,left: 50,right: 50),
      backgroundColor: Colors.cyan ,
      borderRadius: BorderRadius.circular(10),
      message: "Se restablecieron los valores de fabrica.",
      messageColor: Colors.white,
      icon: const Icon(
        Icons.check,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      leftBarIndicatorColor: Colors.teal[300],
    )..show(context);
  }

}

