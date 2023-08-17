import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:serial_app/entities/abrir_sistemas/abrir_sistemas_routes.dart';
import 'package:serial_app/entities/estado_del_sistema/estado_del_sistema_routes.dart';
import 'package:serial_app/screen_util.dart';
import 'package:serial_app/shared/utilities/modals/keyboard_modal.dart';


class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipal();
}





class _PantallaPrincipal extends State<PantallaPrincipal> {

  late bool abrirSistemas = false;
  late bool estadoDelSistema = false;
  late bool configuracion = false;
  ScreenUtil screenUtil = ScreenUtil();


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
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50.0 ,right: 50, top: 90),
                                child: Stack(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/images/caja_y_logo.svg',
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                print("La imagen ha sido clicada");
                              },
                              child: Padding(
                                padding:  EdgeInsets.only(
                                    left: screenUtil.leftPaddingSistemasInactivos(context), right: screenUtil.rigthPaddingSistemasInactivos(context)),
                                child: Stack(
                                  children:<Widget> [
                                  SvgPicture.asset(
                                    'assets/images/boton_sistemas_inactivos.svg',
                                    alignment: Alignment.center,
                                  ),
                                    Row(children:<Widget> [
                                      Expanded(
                                       flex:4,
                                       child:Container(
                                         padding: EdgeInsets.only(top: 10,bottom: 10),
                                         child: Image.asset("assets/images/inactivo.png")
                                       )
                                      ),
                                      Expanded(
                                      flex:6,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child:Text("SISTEMAS INACTIVOS",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeSistemasInactivos(context)),)
                                      )
                                      )
                                    ],)
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100.0 ,right: 100),
                              child: Image.asset(
                                'assets/images/bienvenido_pawn_9.png',
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 70.0 ,right: 70, bottom: 80),
                                child: Stack(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/images/marco_botones.svg',
                                      fit: BoxFit.fill,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 3,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, AbrirSistemasRoutes.view);
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            abrirSistemas = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            abrirSistemas = false;
                                                          });
                                                        },
                                                        child:Padding(
                                                          padding: const EdgeInsets.only(top: 20.0),
                                                          child: Image.asset(
                                                            (abrirSistemas)?'assets/images/abrir_sistemas_activo.png':
                                                            'assets/images/boton_abrir_sistemas.png',
                                                            alignment: Alignment.center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                     Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(2.0),
                                                        child: Text(
                                                          'ABRIR SISTEMAS',
                                                          style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 3,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, EstadoDelSistemaRoutes.view);
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            estadoDelSistema = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            estadoDelSistema = false;
                                                          });
                                                        },
                                                        child:Padding(
                                                          padding: const EdgeInsets.only(top: 20.0),
                                                          child: Image.asset(
                                                            (estadoDelSistema)?'assets/images/activo_edo_sistema.png':
                                                            'assets/images/boton_estado_del_sistema.png',
                                                            alignment: Alignment.center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                     Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: Text(
                                                          'ESTADO DEL SISTEMA',
                                                          style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 3,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      KeyBoardModal.show(context,titleModal: "CLAVE DE ADMINISTRADOR",buttonOrigin: "CONFIGURACION");
                                                    },
                                                    onTapDown: (TapDownDetails details) {
                                                      setState(() {
                                                        configuracion = true;
                                                      });
                                                    },
                                                    onTapUp: (TapUpDetails details) {
                                                      setState(() {
                                                        configuracion = false;
                                                      });
                                                    },
                                                    child:Padding(
                                                      padding: const EdgeInsets.only(top: 20.0),
                                                      child: Image.asset(
                                                        (configuracion) ? 'assets/images/activo_configuracion.png' :
                                                        'assets/images/inactivo configuracion.png',
                                                        alignment: Alignment.center,
                                                      ),
                                                    ),
                                                  )
                                              ),
                                               Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    'CONFIGURACION',
                                                    style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
              //******************************* Pantalla Horizontal [_] ******************************************
              //**************************************************************************************************
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 45.0 ,right: 40, top: 70),
                                child: Stack(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/images/caja_y_logo.svg',
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                print("La imagen ha sido clicada");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 100, right: 100),
                                child: Stack(
                                    children:<Widget> [
                                      SvgPicture.asset(
                                        'assets/images/boton_sistemas_inactivos.svg',
                                        alignment: Alignment.center,
                                      ),
                                      Row(children:<Widget> [
                                        Expanded(
                                            flex:3,
                                            child:Container(
                                                padding: screenUtil.paddingfSistemasInactivos(context),
                                                child: Image.asset("assets/images/inactivo.png",height: 55,)
                                            )
                                        ),
                                        Expanded(
                                            flex:6,
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child:Text("SISTEMAS INACTIVOS",style: TextStyle(color: Colors.white,fontSize: screenUtil.fontSizeSistemasInactivos(context)),)
                                            )
                                        )
                                      ],)
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),


                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60.0 ,right: 110,top: 45),
                              child: Image.asset(
                                'assets/images/bienvenido_pawn_9.png',
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40.0 ,right: 90, bottom: 50),
                                child: Stack(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/images/marco_botones.svg',
                                      fit: BoxFit.fill,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 3,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, AbrirSistemasRoutes.view);
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            abrirSistemas = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            abrirSistemas = false;
                                                          });
                                                        },
                                                        child:Padding(
                                                          padding: const EdgeInsets.only(top: 20.0),
                                                          child: Image.asset(
                                                            (abrirSistemas)?'assets/images/abrir_sistemas_activo.png':
                                                            'assets/images/boton_abrir_sistemas.png',
                                                            alignment: Alignment.center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                     Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(2.0),
                                                        child: Text(
                                                          'ABRIR SISTEMAS',
                                                          style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 3,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(context, EstadoDelSistemaRoutes.view);
                                                        },
                                                        onTapDown: (TapDownDetails details) {
                                                          setState(() {
                                                            estadoDelSistema = true;
                                                          });
                                                        },
                                                        onTapUp: (TapUpDetails details) {
                                                          setState(() {
                                                            estadoDelSistema = false;
                                                          });
                                                        },
                                                        child:Padding(
                                                          padding: const EdgeInsets.only(top: 20.0),
                                                          child: Image.asset(
                                                            (estadoDelSistema)?'assets/images/activo_edo_sistema.png':'assets/images/boton_estado_del_sistema.png',
                                                            alignment: Alignment.center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                     Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: Text(
                                                          'ESTADO DEL SISTEMA',
                                                          style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 3,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    KeyBoardModal.show(context,titleModal: "CLAVE DE ADMINISTRADOR",buttonOrigin: "CONFIGURACION");
                                                  },
                                                  onTapDown: (TapDownDetails details) {
                                                    setState(() {
                                                      configuracion = true;
                                                    });
                                                  },
                                                  onTapUp: (TapUpDetails details) {
                                                    setState(() {
                                                      configuracion = false;
                                                    });
                                                  },
                                                  child:Padding(
                                                    padding: const EdgeInsets.only(top: 20.0),
                                                    child: Image.asset(
                                                      (configuracion)?'assets/images/activo_configuracion.png':
                                                      'assets/images/inactivo configuracion.png',
                                                      alignment: Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                               Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    'CONFIGURACION',
                                                    style: TextStyle(fontSize: screenUtil.fontSizeMenuButtons(context), color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }
}