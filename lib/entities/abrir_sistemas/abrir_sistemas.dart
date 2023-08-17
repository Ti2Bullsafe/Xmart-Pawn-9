import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:serial_app/screen_util.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';
import 'package:serial_app/shared/utilities/modals/keyboard_modal.dart';


class AbrirSistemas extends StatefulWidget {
  const AbrirSistemas({super.key, required this.title});

  final String title;

  @override
  State<AbrirSistemas> createState() => _AbrirSistemas();
}

class _AbrirSistemas extends State<AbrirSistemas> {
  ScreenUtil screenUtil = ScreenUtil();
   bool openBox  = false;
   bool btn1 = false;
   bool btn2 = false;
   bool btn3 = false;
   bool btn4 = false;
   bool btn5 = false;
   bool btn6 = false;
   bool btn7 = false;
   bool btn8 = false;
   bool btn9 = false;

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
                      flex: 5,
                      child: GestureDetector(
                        onTap: () async {
                          String? result = await KeyBoardModal.show(
                              context,
                              titleModal:
                              "INTRODUZCA ID DE USUARIO",
                              buttonOrigin: "ABRIR_CAJA");
                          if (result != null && result == validateUserComplete) {
                            setState(() {
                              openBox = true;
                            });
                          }
                        },
                        child:Container(
                          alignment: Alignment.center,
                          child:  Container(
                                width:screenUtil.widthCajaFuerte(context),
                                height: screenUtil.heightCajaFuerte(context),
                                child:Stack(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/images/pantalla_abrir_caja_fuerte_con_luz.svg',
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),)
                            ),)
                    ),
                    if (openBox)
                      Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Image.asset(
                                    alignment: Alignment.center,
                                    'assets/images/pantalla_abrir_teclado_con_luz.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: screenUtil.edgeTecladoConLuz(context),
                                    child: Column(
                                      children: [
                                        Table(
                                          children: <TableRow>[
                                            TableRow(
                                              children: <Widget>[
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      setState(() {
                                                        btn1 = true;
                                                      });
                                                      String? result =
                                                      await KeyBoardModal.show(
                                                          context,
                                                          numberTap:
                                                          1,
                                                          titleModal:
                                                          "CAJON 1 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                      if (result != "MODULO_1_ABIERTO") {
                                                        setState(() {
                                                          btn1 = false;
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      child: const Center(
                                                        child: Text(
                                                          "1",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 2,
                                                          titleModal:
                                                              "CAJON 2 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      child: const Center(
                                                        child: Text(
                                                          "2",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 3,
                                                          titleModal:
                                                              "CAJON 3 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      child: const Center(
                                                        child: Text(
                                                          "3",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 4,
                                                          titleModal:
                                                              "CAJON 4 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "4",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 5,
                                                          titleModal:
                                                              "CAJON 5 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "5",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 6,
                                                          titleModal:
                                                              "CAJON 6 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "6",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 7,
                                                          titleModal:
                                                              "CAJON 7 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "7",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 8,
                                                          titleModal:
                                                              "CAJON 8 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "8",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TableCell(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(
                                                          context,
                                                          numberTap: 9,
                                                          titleModal:
                                                              "CAJON 9 INTRODUZCA ID DE USUARIO",
                                                          buttonOrigin: "ABRIR_CAJON");
                                                    },
                                                    child: Container(
                                                      width: deviceHeight(
                                                              context) *
                                                          0.06,
                                                      height: deviceHeight(
                                                              context) *
                                                          0.05,
                                                      child: const Center(
                                                        child: Text(
                                                          "9",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.cyan,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    if (!openBox)
                      Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      String? result = await KeyBoardModal.show(
                                          context,
                                          titleModal:
                                          "INTRODUZCA ID DE USUARIO",
                                          buttonOrigin: "ABRIR_CAJA");
                                      if (result != null && result == validateUserComplete) {
                                        setState(() {
                                          openBox = true;
                                        });
                                      }
                                    },
                                    child: Image.asset(
                                      alignment: Alignment.center,
                                      'assets/images/pantalla_abrir_teclado_con_luz_bn.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FractionallySizedBox(
                                  heightFactor: 0.37,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/images/regresar.png',
                                        fit: BoxFit.fill,
                                      )
                                  )
                              ),
                            )
                          ],
                        ))
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
                        flex: 11,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Column(
                                    children: [
                                      Expanded(
                                        flex:6,
                                        child: GestureDetector(
                                          onTap: () async {
                                            String? result = await KeyBoardModal.show(
                                                context,
                                                titleModal:
                                                "INTRODUZCA ID DE USUARIO",
                                                buttonOrigin: "ABRIR_CAJA");
                                            if (result != null && result == validateUserComplete) {
                                              setState(() {
                                                openBox = true;
                                              });
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: FractionallySizedBox(
                                              widthFactor: 0.78,
                                              heightFactor: 0.78,
                                              child: Stack(
                                                children: <Widget>[
                                                  SvgPicture.asset(
                                                    'assets/images/pantalla_abrir_caja_fuerte_con_luz.svg',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                      ),
                                    Expanded(
                                        flex:1,
                                        child:Container(
                                            padding: EdgeInsets.only(bottom:screenUtil.bottomPaddingImgSeguro(context)),
                                            alignment: Alignment.center,
                                            width: double.infinity,
                                            height: double.infinity,
                                            child:Image.asset(
                                              openBox ? 'assets/images/vulnerable.png':
                                              'assets/images/seguro.png',
                                              fit: BoxFit.fill,
                                            ),
                                        )
                                      )
                                    ])),
                            if (openBox)
                              Expanded(
                                  child: FractionallySizedBox(
                                widthFactor: 0.78,
                                heightFactor: 0.79,
                                child:
                                Column(children: [
                                  Expanded(
                                    flex:7,
                                    child: Container(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/pantalla_abrir_teclado_con_luz.png',
                                          fit: BoxFit.fill,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: deviceHeight(context) * 0.3,
                                                right:screenUtil.rightPaddingKeyboard(context)),
                                            child: FractionallySizedBox(
                                                widthFactor: 0.28,
                                                child: Column(
                                                  children: [
                                                    Table(
                                                      children: <TableRow>[
                                                        TableRow(
                                                          children: <Widget>[
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn1 = true;
                                                                  });
                                                                  String? result =
                                                                  await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      1,
                                                                      titleModal:
                                                                      "CAJON 1 INTRODUZCA ID DE USUARIO",
                                                                      buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_1_ABIERTO") {
                                                                    setState(() {
                                                                      btn1 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn1 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                   Center(
                                                                    child: Text(
                                                                      "1",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: btn1 ? Colors.white :Colors.cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn2 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      2,
                                                                      titleModal:
                                                                      "CAJON 2 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_2_ABIERTO") {
                                                                    setState(() {
                                                                      btn2 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn2 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "2",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn3 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      3,
                                                                      titleModal:
                                                                      "CAJON 3 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_3_ABIERTO") {
                                                                    setState(() {
                                                                      btn3 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn3 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "3",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: <Widget>[
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn4 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      4,
                                                                      titleModal:
                                                                      "CAJON 4 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_4_ABIERTO") {
                                                                    setState(() {
                                                                      btn4 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn4 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "4",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn5 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      5,
                                                                      titleModal:
                                                                      "CAJON 5 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_5_ABIERTO") {
                                                                    setState(() {
                                                                      btn5 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn5 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "5",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn6 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      6,
                                                                      titleModal:
                                                                      "CAJON 6 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_6_ABIERTO") {
                                                                    setState(() {
                                                                      btn6 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn6 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "6",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        TableRow(
                                                          children: <Widget>[
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn7 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      7,
                                                                      titleModal:
                                                                      "CAJON 7 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_7_ABIERTO") {
                                                                    setState(() {
                                                                      btn7 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn7 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "7",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn8 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      8,
                                                                      titleModal:
                                                                      "CAJON 8 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_8_ABIERTO") {
                                                                    setState(() {
                                                                      btn8 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn8 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "8",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            TableCell(
                                                              child:
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  setState(() {
                                                                    btn9 = true;
                                                                  });
                                                                  String? result =
                                                                      await KeyBoardModal.show(
                                                                      context,
                                                                      numberTap:
                                                                      9,
                                                                      titleModal:
                                                                      "CAJON 9 INTRODUZCA ID DE USUARIO",
                                                                          buttonOrigin: "ABRIR_CAJON");
                                                                  if (result != "MODULO_9_ABIERTO") {
                                                                    setState(() {
                                                                      btn9 = false;
                                                                    });
                                                                  }
                                                                },
                                                                child: Container(
                                                                  color: btn9 ? Colors.cyan[300] : Colors.transparent,
                                                                  width: deviceHeight(
                                                                      context) *
                                                                      0.06,
                                                                  height: deviceHeight(
                                                                      context) *
                                                                      0.08,
                                                                  child:
                                                                  const Center(
                                                                    child: Text(
                                                                      "9",
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        20,
                                                                        color: Colors
                                                                            .cyan,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),),
                                  Expanded(
                                      flex:1,
                                      child:Container(
                                        padding: screenUtil.paddingTopBtnSeguro(context),
                                        alignment: Alignment.bottomCenter,
                                        width: double.infinity,
                                        height: double.infinity,
                                        child:Image.asset('assets/images/seguro.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                  )
                                ],),    
                              )),
                            if (!openBox)
                              Expanded(
                                  child: FractionallySizedBox(
                                    widthFactor: 0.78,
                                    heightFactor: 0.79,
                                    child: Column(children: [
                                      Expanded(
                                        flex:7,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Stack(
                                            children: <Widget>[
                                             GestureDetector(
                                               onTap: () async {
                                                 String? result = await KeyBoardModal.show(
                                                     context,
                                                     titleModal:
                                                     "INTRODUZCA ID DE USUARIO",
                                                     buttonOrigin: "ABRIR_CAJA");
                                                 if (result != null && result == validateUserComplete) {
                                                   setState(() {
                                                     openBox = true;
                                                   });
                                                 }
                                               },
                                                 child:Image.asset(
                                                'assets/images/pantalla_abrir_teclado_con_luz_bn.png',
                                                fit: BoxFit.fill,
                                              ),)
                                            ],
                                          ),
                                        ),),
                                      const Expanded(
                                          flex:1,
                                          child: Text(""))
                                    ],),
                                  )),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FractionallySizedBox(
                                  heightFactor: 0.77,
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/images/regresar.png',
                                        fit: BoxFit.fill,
                                      )
                                  )
                              ),
                            )
                          ],
                        ))
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}