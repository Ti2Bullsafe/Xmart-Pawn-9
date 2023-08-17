import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serial_app/entities/configuracion/configuracion_routes.dart';
import 'package:serial_app/screen_util.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';

class KeyBoardModal extends StatefulWidget {
  final int? numberTap;
  final String? titleModal;
  final String? buttonOrigin;
  KeyBoardModal({Key? key, this.numberTap,this.titleModal, this.buttonOrigin});
  @override
  KeyBoardWidget createState() => KeyBoardWidget(numberTap: numberTap,titleModal: titleModal,buttonOrigin: buttonOrigin);

 //puedes llamar directamente desde otra parte KeyBoardModal.show(context, numberTap: 1).


  static Future<String?> show(BuildContext context, {int? numberTap, String? titleModal, String? buttonOrigin}) {
    return showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return KeyBoardModal(
          numberTap: numberTap,
          titleModal: titleModal,
          buttonOrigin: buttonOrigin,
        );
      },
    );
  }

  Future<String?> popWithValue(BuildContext context, String? value) {
    Navigator.pop(context, value); // Return the value when the method is called
    return Future.value(value);
  }
}

class KeyBoardWidget extends State<KeyBoardModal>{
  final int? numberTap;
  final String? titleModal;
  final String? buttonOrigin;

  late String title ="" ;
  late String screenMessage ="" ;
  late String inputKey ="";
  late String inputKeyAux="";
  late int intent =0;
  late int maxLength =5;

  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  bool btn4 = false;
  bool btn5 = false;
  bool btn6 = false;
  bool btn7 = false;
  bool btn8 = false;
  bool btn9 = false;
  bool btn0 = false;
  bool btnBack = false;
  bool btnOk = false;
  ScreenUtil screenUtil = ScreenUtil();

  Color screenMessageColor = Colors.white;

  KeyBoardWidget({Key? key,this.numberTap,this.titleModal,this.buttonOrigin});

  @override
  void initState() {

    if (titleModal != null && titleModal != "") {
      title = titleModal!;
    }
    if (intent == 0 && buttonOrigin == "CAMBIAR_CLAVE_ADMINISTRADOR" ||
        intent == 0 && buttonOrigin == "CAMBIAR_CLAVE_USUARIO") {
      setState(() {
        intent = 1;
      });
    }
    if(buttonOrigin == "ABRIR_CAJA" || buttonOrigin == "ABRIR_CAJON"){
      setState(() {
        title="INTRODUZCA ID DE USUARIO";
        maxLength = 0;
        intent = 1;

      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0), // Ajusta el radio para cambiar el grado de redondez
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: (orientation == Orientation.portrait)?MediaQuery.of(context).size.width *0.42:MediaQuery.of(context).size.width *0.32,
        height: (buttonOrigin == "BT_VINCULADO" || buttonOrigin == "SISTEMA_RANDOMICO")? 300 : screenUtil.heightKeyboard(context),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image(
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                image: AssetImage((buttonOrigin == "BT_VINCULADO" || buttonOrigin == "SISTEMA_RANDOMICO")?
                'assets/keyboard_buttons/panel_informativo1.png':'assets/keyboard_buttons/teclado.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width:350,
                height: double.infinity,
                child:  Column(
                  children:<Widget> [
                    Expanded(
                      flex: 1,
                      child:Container(
                          alignment: Alignment.center,
                          child:  Text(title,
                          style: TextStyle(color: Colors.white,fontSize: 12),)
                      ),
                    ),
                        if (buttonOrigin == "BT_VINCULADO" ||
                            buttonOrigin == "SISTEMA_RANDOMICO")
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: EdgeInsets.only(left: 60,right: 40),
                                  alignment: Alignment.center,
                                  child: const TextField(
                                    style: TextStyle(color: Colors.white),
                                    // Establecer el color del texto ingresado
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .white), // Color del texto de la etiqueta
                                    ),
                                  )))
                        else
                          Expanded(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.center,
                                child: Text(screenMessage,
                                    style:
                                        TextStyle(color: screenMessageColor, fontSize: screenUtil.fontSizeKeyboard(context)))),
                          ),
                        if(buttonOrigin == "BT_VINCULADO" || buttonOrigin == "SISTEMA_RANDOMICO")
                      Expanded(
                        flex: 3,
                        child:Container(
                          padding: EdgeInsets.only(top: 60,bottom: 60,left: 15,right: 15),
                          child:Image(
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                            image: AssetImage((buttonOrigin == "BT_VINCULADO")?'assets/keyboard_buttons/btn_actualizar.png':'assets/keyboard_buttons/btn_siguente.png'),
                          ),
                        )
                      )
                    else
                    Expanded(
                    flex: 5,
                      child: Container(
                          padding: EdgeInsets.only(left: 25, right: 25),
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child:
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(1);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn1 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn1 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn1)?'assets/keyboard_buttons/b1_luz.png':'assets/keyboard_buttons/bt1.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(2);

                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn2 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn2 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn2)?'assets/keyboard_buttons/b2_luz.png':'assets/keyboard_buttons/bt2.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(3);

                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn3 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn3 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn3)?'assets/keyboard_buttons/b3_luz.png':'assets/keyboard_buttons/bt3.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    // Agregar aquí las imágenes para la segunda fila
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(4);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                        setState(() {
                                          btn4 = true;
                                        });
                                      },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn4 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn4)?'assets/keyboard_buttons/b4_luz.png':'assets/keyboard_buttons/bt4.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(5);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn5 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn5 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn5)?'assets/keyboard_buttons/b5_luz.png':'assets/keyboard_buttons/bt5.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(6);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn6 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn6 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn6)?'assets/keyboard_buttons/b6_luz.png':'assets/keyboard_buttons/bt6.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    // Agregar aquí las imágenes para la tercera fila
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(7);

                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn7 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn7 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn7)?'assets/keyboard_buttons/b7_luz.png':'assets/keyboard_buttons/bt7.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(8);

                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn8 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn8 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn8)?'assets/keyboard_buttons/b8_luz.png':'assets/keyboard_buttons/bt8.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(9);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn9 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn9 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn9)?'assets/keyboard_buttons/b9_luz.png':'assets/keyboard_buttons/bt9.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    // Agregar aquí las imágenes para la cuarta fila
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          deleteCharacter();
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btnBack = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btnBack = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btnBack)?'assets/keyboard_buttons/btback_luz.png':'assets/keyboard_buttons/btback.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          writeCharacterKey(0);
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btn0 = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btn0 = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btn0)?'assets/keyboard_buttons/b0_luz.png':'assets/keyboard_buttons/bt0.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          buttonOkEvents();
                                        },
                                        onTapDown: (TapDownDetails details) {
                                          setState(() {
                                            btnOk = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            btnOk = false;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child:  Image(
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            image: AssetImage((btnOk)?'assets/keyboard_buttons/btok_luz.png':'assets/keyboard_buttons/btok.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      )),
                ],)
              )
            ),
          ],
        ),
      ),
    );});
  }

  buttonOkEvents() {
    if(buttonOrigin == "ABRIR_CAJON"){
      if (intent == 1) {
        validateUserIdKey("userId");
      }
      if (intent == 2) {
        validateUserKey("userKey");
      }
    }
    if (buttonOrigin == "CONFIGURACION") {
      validateAdministratorKey("administratorKey");
    }
    if (buttonOrigin == "CAMBIAR_CLAVE_ADMINISTRADOR") {
      changeAdministratorOrUserKey("administratorKey");
    }
    if (buttonOrigin == "CAMBIAR_CLAVE_USUARIO") {
      changeAdministratorOrUserKey("userKey");
    }
    if (buttonOrigin == "ABRIR_CAJA") {
      if (intent == 1) {
        validateUserIdKey("userId");
      }
      if (intent == 2) {
        validateUserKey("userKey");
      }
    }
  }




  void changeAdministratorOrUserKey(String key) {
    if(intent ==1){
      setState((){
        screenMessage = "VUELVE A ESCRIBIR LA CLAVE";
        screenMessageColor = Colors.green;
        inputKey ="";
      });
      Timer(const Duration(seconds: 1), () =>{
        setState((){
          intent =2;
          inputKey ="";
          screenMessage="";
        })
      });
    }

    if(intent == 2){
      if(inputKey == inputKeyAux){
        saveDataToCache(key, inputKey);
        setState((){
          screenMessage = "CLAVE CAMBIADA";
          screenMessageColor = Colors.green;
        });
        Timer(const Duration(seconds: 1), () =>{
        Navigator.of(context).pop()
        });
      }else{
        setState((){
          screenMessage = "LAS CLAVES NO COINCIDEN";
          screenMessageColor = Colors.red;
          intent= 1;
        });
        Timer(const Duration(seconds: 1), () =>{
        setState((){
        screenMessage = "INTENTA NUEVAMENTE";
        screenMessageColor = Colors.red;
        })
        });

        Timer(const Duration(seconds: 2), () =>{
          setState((){
            screenMessage = "";
            screenMessageColor = Colors.green;
            inputKey="";
            inputKeyAux="";
          })
        });
      }

    }

  }

Future<void> validateUserIdKey(String key) async {
  String userIdKey = await readDataFromCache(key);
  if(inputKey == userIdKey) {
    setState(() {
      screenMessage = "ID CORRECTO";
      screenMessageColor = Colors.green;
      maxLength = 5;
    });
    Timer(const Duration(seconds: 1), () =>{
      setState((){
        screenMessageColor = Colors.cyan;
        screenMessage = title = "INTRODUZCA CLAVE DE USUARIO";
        intent = 2;
        inputKey="";
      })

    });
    Timer(const Duration(seconds: 2), () =>{
      setState((){
        screenMessageColor = Colors.white;
        screenMessage="";
        inputKey="";
      })
    });

  }else{
    setState(() {
      screenMessage = "ID INCORRECTO";
      screenMessageColor = Colors.red;
    });

    Timer(const Duration(seconds: 1), () =>{
      setState((){
        screenMessage ="";
        inputKey="";
        screenMessageColor = Colors.white;
      })
    });
  }
}

Future<void> validateUserKey(String key) async {
  String userKey = await readDataFromCache(key);
  if(inputKey == userKey) {
    setState(() {
      screenMessage = "CLAVE CORRECTA";
      screenMessageColor = Colors.green;
    });
    Timer(const Duration(seconds: 1), () =>
     widget.popWithValue(context, validateUserComplete)
    );
  }else{
    setState(() {
      screenMessage = "CLAVE INCORRECTA";
      screenMessageColor = Colors.red;
    });

    Timer(const Duration(seconds: 1), () =>{
      setState((){
        screenMessage ="";
        inputKey="";
        screenMessageColor = Colors.white;
      })
    });
  }
}

 void validateAdministratorKey(String key) async {
    String administratorKey = await readDataFromCache(key);
    print(administratorKey);
    if(inputKey == administratorKey){
      setState(() {
        screenMessage = "CLAVE CORRECTA";
        screenMessageColor = Colors.green;
      });
        Timer(const Duration(seconds: 1), () =>{
          Navigator.pushNamed(context, ConfiguracionRoutes.view).then((value) =>  Navigator.pop(context))
        });


    }else{
      setState(() {
        screenMessage = "CLAVE INCORRECTA";
        screenMessageColor = Colors.red;
      });

      Timer(const Duration(seconds: 2), () =>{
        setState((){
          screenMessage ="";
          inputKey="";
          screenMessageColor = Colors.white;
        })
      });
    }
  }

  void writeCharacterKey(int number) {
    if (inputKey.length <= maxLength) {
      setState(() {
        inputKey = inputKey + number.toString();
        if (intent == 1) {
          inputKeyAux = inputKey;
        }
        screenMessage = screenMessage +
            (buttonOrigin == "CONFIGURACION" ||
             buttonOrigin == "CAMBIAR_CLAVE_ADMINISTRADOR" ||
             buttonOrigin == "CAMBIAR_CLAVE_USUARIO" ?
            "[ ] " : "*");
      });
    }
  }

  void deleteCharacter() {
    if (inputKey.isNotEmpty) {
      setState(() {
        screenMessage = screenMessage.substring(0, screenMessage.length - (screenMessage.length ~/ inputKey.length));
        inputKey = inputKey.substring(0, inputKey.length - 1);
        if (intent == 1) {
          inputKeyAux = inputKey;
        }
      });
    }
  }




}

