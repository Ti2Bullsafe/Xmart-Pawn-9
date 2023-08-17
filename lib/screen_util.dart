import 'dart:math';
import 'package:flutter/material.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';

class ScreenUtil {
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = sqrt(size.width * size.width + size.height * size.height);
    return diagonal >= 915; //phone diagonal: 914.3499550377139 /tablet diagonal: 1104.4508127226504
  }
//9014
//*************************ABRIR SISTEMAS STYLES*************************//

  double widthCajaFuerte(BuildContext context) {
    return (isTablet(context))
        ? 630
        : 340;
  }

  EdgeInsets paddingTopBtnSeguro(BuildContext context) {
    return (isTablet(context))
        ? EdgeInsets.only(top: 20)
        : EdgeInsets.only(top: 10);
  }

  double heightCajaFuerte(BuildContext context) {
    return (isTablet(context))
        ? 470
        : 320;
  }

  double rightPaddingKeyboard(BuildContext context) {
    return (isTablet(context))
        ? deviceWidth(context) * 0.01
        : deviceWidth(context) * 0.07;
  }

  double bottomPaddingImgSeguro(BuildContext context) {
    return (isTablet(context))
        ? 50
        : 25;
  }

 double buttonPaddingImg(BuildContext context) {
    return (isTablet(context))
        ? 50
        : 25;
  }

  //******************************END************************************//

  //*************************KEYBOARD STYLES*************************//
  double fontSizeKeyboard(BuildContext context) {
    return (isTablet(context))
        ? 15
        : 8;
  }

  double heightKeyboard(BuildContext context) {
    return (isTablet(context))
        ? 570
        : 400;
  }

  //*************************ESTADO DEL SISTEMA STYLES*************************//
  double leftPaddingTextTable(BuildContext context) {
    return (isTablet(context))
        ? 50
        : 20;
  }

  double leftPaddingTextTableKeyboard(BuildContext context) {
    return (isTablet(context))
        ? 30
        : 20;
  }

  double verticalLeftPaddingTextTable(BuildContext context) {
    return (isTablet(context))
        ? 60
        : 40;
  }

  EdgeInsets edgeInsetsBtnSeguro(BuildContext context) {
    return (isTablet(context))
        ? EdgeInsets.only(left: 30,right: 15,top: 10,bottom: 5)
        : EdgeInsets.only(left: 10, right: 5, top: 10);
  }
  EdgeInsets edgeInsetsBtnSeguroCaja(BuildContext context) {
    return (isTablet(context))
        ? EdgeInsets.only(left: 40,right: 15,top: 15)
        : EdgeInsets.only(left: 35, right: 5, top: 10);
  }

  EdgeInsets edgeTecladoConLuz(BuildContext context) {
    return (isTablet(context))
        ? EdgeInsets.only(
        top: deviceHeight(context) * 0.179,
        right: deviceWidth(context) * 0.38,
        left: deviceWidth(context) * 0.437)
        : EdgeInsets.only(
        top: deviceHeight(context) * 0.179,
        right: deviceWidth(context) * 0.35,
        left: deviceWidth(context) * 0.427);
  }

  double widthEstadoTeclado(BuildContext context) {
    return (isTablet(context))
        ? 0.65
        : 0.85;
  }
  double heightEstadoTeclado(BuildContext context) {
    return (isTablet(context))
        ? 0.85
        : 0.75;
  }

  double detailsFontSize(BuildContext context) {
    return (isTablet(context))
        ? 11
        : 6;
  }
  double widthTablaEstado(BuildContext context) {
    return (isTablet(context))
        ? 700
        : 355;
  }
  double widthTablaEstadoHorizontal(BuildContext context) {
    return (isTablet(context))
        ? 700
        : 655;
  }
  //*************************PANTALLA PRICIPAL STYLES*************************//

  double leftPaddingSistemasInactivos(BuildContext context) {
    return (isTablet(context))
        ? 100
        : 50;
  }

  double rigthPaddingSistemasInactivos(BuildContext context) {
    return (isTablet(context))
        ? 100
        : 50;
  }

  double fontSizeSistemasInactivos(BuildContext context) {
    return (isTablet(context))
        ? 18
        : 10;
  }
  EdgeInsets paddingfSistemasInactivos(BuildContext context) {
    return (isTablet(context))
        ? EdgeInsets.only(top: 10,bottom: 10)
        :EdgeInsets.only(top: 25,bottom: 25);
  }
  double fontSizeMenuButtons(BuildContext context) {
    return (isTablet(context))
        ? 12
        : 10;
  }

}

