import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:serial_app/entities/estado_del_sistema/bloc/estado_del_sistema_bloc.dart';
import 'package:serial_app/entities/estado_del_sistema/estado_del_sistema_cajones_model.dart';
import 'package:serial_app/screen_util.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';
import 'package:serial_app/shared/utilities/modals/keyboard_modal.dart';

import 'estado_del_sistema_model.dart';


class EstadoDelSistema extends StatefulWidget {
  const EstadoDelSistema({super.key, required this.title});

  final String title;

  @override
  State<EstadoDelSistema> createState() => _EstadoDelSistema();
}

class _EstadoDelSistema extends State<EstadoDelSistema> {

 late BoxGateDataModel? boxGateDataModel = BoxGateDataModel(null,null,null,null,null,null);
 late DrawersDataModel? drawersDataModel = DrawersDataModel(null,null,null,null,null,null);
 DateTime nowDateTime = DateTime.now().toLocal();
 ScreenUtil screenUtil = new ScreenUtil();
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      incrementTime();
    });
    return BlocListener<EstadoDelSistemaBloc, EstadoDelSistemaState>(
        listener: (context, state) {

          if (state.boxGateDataModel != null) {
        setState(() {
          boxGateDataModel = state.boxGateDataModel;
        });
      }
      if (state.drawersDataModel != null) {
        setState(() {
          drawersDataModel = state.drawersDataModel;
        });
      }
    },
    child:
    Scaffold(
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
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(top: 80),
                                  width: double.infinity,
                                  alignment: Alignment.bottomCenter,
                                  child:  Stack(
                                     alignment: Alignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/state_screen/estado_del_sistema_caja.png',
                                          fit: BoxFit.fill,
                                        ),
                                        Center(
                                            child: Row(
                                              children:<Widget> [
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    Column(children:<Widget>  [
                                                      Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ")),),
                                                    ],)
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    Column(children:<Widget>  [
                                                      Expanded(flex: 2, child: Container(alignment: Alignment.centerLeft,child:  Text("",)),),
                                                      Expanded(flex: 1, child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.verticalLeftPaddingTextTable(context)),child:  Text((boxGateDataModel!.cerradura != null) ?"cerradura: "+ boxGateDataModel!.cerradura! :" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context)),)),),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.verticalLeftPaddingTextTable(context)),child:  Text((boxGateDataModel!.puerta != null)?"puerta: "+boxGateDataModel!.puerta!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))))),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.verticalLeftPaddingTextTable(context)),child:  Text((boxGateDataModel!.ultimaApertura != null)?"ultima apertura:\n "+boxGateDataModel!.ultimaApertura!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.verticalLeftPaddingTextTable(context)),child:  Text((boxGateDataModel!.duracion != null)?"duracion: "+boxGateDataModel!.duracion!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.verticalLeftPaddingTextTable(context)),child:  Text((boxGateDataModel!.codigoCierre != null)?"codigo de cierre: "+boxGateDataModel!.codigoCierre!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: screenUtil.edgeInsetsBtnSeguroCaja(context),child:  Image.asset('assets/images/seguro.png', fit: BoxFit.fill,),)),
                                                    ],)
                                                ),
                                              ],)
                                        )
                                      ],
                                    ),

                                )),
                            Expanded(
                                child: FractionallySizedBox(
                                  widthFactor: screenUtil.widthEstadoTeclado(context),
                                  heightFactor: screenUtil.heightEstadoTeclado(context),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/state_screen/pantalla_estado_teclado.png',
                                          fit: BoxFit.fill,
                                        ),
                                        Center(
                                            child: Row(
                                              children:<Widget> [
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    Column(children:<Widget>  [
                                                      Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ")),),
                                                    ],)
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    Column(children:<Widget>  [
                                                      Expanded(flex: 2, child: Container(alignment: Alignment.centerLeft,child:  Text("",)),),
                                                      Expanded(flex: 1, child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((drawersDataModel!.cerradura != null) ?"cerradura: "+drawersDataModel!.cerradura!:" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context)),)),),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((drawersDataModel!.ultimoCajonAbierto != null)?"puerta: "+drawersDataModel!.ultimoCajonAbierto!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))))),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((drawersDataModel!.ultimaApertura != null)?"ultima apertura:\n "+drawersDataModel!.ultimaApertura!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((drawersDataModel!.duracion != null)?"duracion: "+drawersDataModel!.duracion!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((drawersDataModel!.codigoCierre != null)?"codigo de cierre: "+drawersDataModel!.codigoCierre!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                      Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: screenUtil.edgeInsetsBtnSeguro(context),child:  Image.asset('assets/images/seguro.png', fit: BoxFit.fill,),)),
                                                    ],)
                                                ),
                                              ],)
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child:
                      Container(
                          width: screenUtil.widthTablaEstado(context),
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/state_screen/tabla_estado_general.png',
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Center(
                                    child: Row(
                                      children:<Widget> [
                                        Expanded(
                                            flex: 1,
                                            child:
                                            Column(children:<Widget>  [
                                              Expanded(flex: 1, child: Container(alignment: Alignment.bottomCenter,child:  Text(" Fecha: "+getDayName(nowDateTime)+" "+nowDateTime.day.toString()+" de "+getMonthName(nowDateTime)+" "+nowDateTime.year.toString(),style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)),)),),
                                              Expanded(flex: 1, child: Container(alignment: Alignment.topCenter,child:  Text(" Hora: "+nowDateTime.hour.toString()+" : "+nowDateTime.minute.toString()+" : "+nowDateTime.second.toString(),style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                            ],)
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:
                                            Column(children:<Widget>  [
                                              Expanded(flex: 1, child: Container(alignment: Alignment.bottomCenter,child:  Text(" Sistema randomico: no vinculado",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                              Expanded(flex: 1, child: Container(alignment: Alignment.topCenter,child:  Text(" ID de la cerradura:",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                            ],)
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child:
                                            Column(children:<Widget>  [
                                              Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                              Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),

                                            ],)
                                        ),
                                      ],)
                                )])),

                    ),
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
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: FractionallySizedBox(
                                widthFactor: 0.83,
                                heightFactor: 0.75,
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/state_screen/estado_del_sistema_caja.png',
                                      fit: BoxFit.fill,
                                    ),
                                Center(
                                  child: Row(
                                        children:<Widget> [
                                          Expanded(
                                            flex: 1,
                                              child:
                                          Column(children:<Widget>  [
                                            Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ")),),
                                          ],)
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child:
                                          Column(children:<Widget>  [
                                            Expanded(flex: 2, child: Container(alignment: Alignment.centerLeft,child:  Text("",)),),
                                            Expanded(flex: 1, child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((boxGateDataModel!.cerradura != null) ?"cerradura: "+ boxGateDataModel!.cerradura! :" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context)),)),),
                                            Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((boxGateDataModel!.puerta != null)?"puerta: "+boxGateDataModel!.puerta!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))))),
                                            Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((boxGateDataModel!.ultimaApertura != null)?"ultima apertura:\n "+boxGateDataModel!.ultimaApertura!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                            Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((boxGateDataModel!.duracion != null)?"duracion: "+boxGateDataModel!.duracion!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                            Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTable(context)),child:  Text((boxGateDataModel!.codigoCierre != null)?"codigo de cierre: "+boxGateDataModel!.codigoCierre!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                            Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: screenUtil.edgeInsetsBtnSeguroCaja(context),child:  Image.asset('assets/images/seguro.png', fit: BoxFit.fill,),)),
                                          ],)
                                          ),
                                        ],)
                                    )
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child:FractionallySizedBox(
                              widthFactor: 0.76,
                              heightFactor: 0.75,
                              child:  Stack(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/state_screen/pantalla_estado_teclado.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Center(
                                        child: Row(
                                          children:<Widget> [
                                            Expanded(
                                                flex: 1,
                                                child:
                                                Column(children:<Widget>  [
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  Text(" ")),),
                                                ],)
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                Column(children:<Widget>  [
                                                  Expanded(flex: 2, child: Container(alignment: Alignment.centerLeft,child:  Text("",)),),
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTableKeyboard(context)),child:  Text((drawersDataModel!.cerradura != null) ?"cerradura: "+drawersDataModel!.cerradura!:" ",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context)),)),),
                                                  Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTableKeyboard(context)),child:  Text((drawersDataModel!.ultimoCajonAbierto != null)?"puerta: "+drawersDataModel!.ultimoCajonAbierto!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))))),
                                                  Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTableKeyboard(context)),child:  Text((drawersDataModel!.ultimaApertura != null)?"ultima apertura:\n "+drawersDataModel!.ultimaApertura!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                  Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTableKeyboard(context)),child:  Text((drawersDataModel!.duracion != null)?"duracion: "+drawersDataModel!.duracion!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                  Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: screenUtil.leftPaddingTextTableKeyboard(context)),child:  Text((drawersDataModel!.codigoCierre != null)?"codigo de cierre: "+drawersDataModel!.codigoCierre!:"",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeKeyboard(context))),)),
                                                  Expanded(flex: 1,child: Container(alignment: Alignment.centerLeft,padding: screenUtil.edgeInsetsBtnSeguro(context),child:  Image.asset('assets/images/seguro.png', fit: BoxFit.fill,),)),
                                                ],)
                                            ),
                                          ],)
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child:
                          Container(
                              width: screenUtil.widthTablaEstadoHorizontal(context),
                              child: Stack(
                                alignment: Alignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/state_screen/tabla_estado_general.png',
                                      fit: BoxFit.fill,
                                      width: 900,
                                      height: double.infinity,
                                    ),
                                    Center(
                                        child: Row(
                                          children:<Widget> [
                                            Expanded(
                                                flex: 1,
                                                child:
                                                Column(children:<Widget>  [
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.bottomCenter,child:  Text(" Fecha: "+getDayName(nowDateTime)+" "+nowDateTime.day.toString()+" de "+getMonthName(nowDateTime)+" "+nowDateTime.year.toString(),style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)),)),),
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.topCenter,child:  Text(" Hora: "+nowDateTime.hour.toString()+" : "+nowDateTime.minute.toString()+" : "+nowDateTime.second.toString(),style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                                ],)
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                Column(children:<Widget>  [
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.bottomCenter,child:  Text(" Sistema randomico: no vinculado",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.topCenter,child:  Text(" ID de la cerradura:",style: TextStyle(color: Colors.white,fontSize: screenUtil.detailsFontSize(context)))),),
                                                ],)
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                Column(children:<Widget>  [
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  const Text(" ",style: TextStyle(color: Colors.white))),),
                                                  Expanded(flex: 1, child: Container(alignment: Alignment.center,child:  const Text(" ",style: TextStyle(color: Colors.white))),),

                                                ],)
                                            ),
                                          ],)
                                    )])),

                    ),
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
                ),
            ],
          );
        },
      ),
    ));
  }

 Future<void> incrementTime() async {
   setState(() {
     nowDateTime = DateTime.now().toLocal();
   });
 }



}