
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:serial_app/backend/schema/structs/b_t_device_struct.dart';
import 'package:serial_app/flutter_flow/flutter_flow_animations.dart';
import 'package:serial_app/flutter_flow/flutter_flow_theme.dart';
import 'package:serial_app/flutter_flow/flutter_flow_util.dart';
import 'package:serial_app/flutter_flow/nav/serialization_util.dart';
import 'package:serial_app/widgets/empty_devices/empty_devices_widget.dart';
import 'package:serial_app/widgets/strength_indicator/strength_indicator_widget.dart';
import '../../../custom_code/actions/index.dart' as actions;

import '../../../flutter_flow/flutter_flow_model.dart';
import '../home_page_model.dart';

class BluetoothConfigurationModal extends StatefulWidget {
  final bool isBTEnabled;

  BluetoothConfigurationModal({Key? key, bool? isBTEnabled,}): this.isBTEnabled = isBTEnabled ?? false, super(key: key);
  @override
  BluetoothConfigurationWidget createState() => BluetoothConfigurationWidget();

  //puedes llamar directamente desde otra parte KeyBoardModal.show(context, numberTap: 1).


  static Future<String?> show(BuildContext context,bool? isBTEnabled) {
    return showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BluetoothConfigurationModal(isBTEnabled:isBTEnabled);
      },
    );
  }

  Future<String?> popWithValue(BuildContext context, String? value) {
    Navigator.pop(context, value); // Return the value when the method is called
    return Future.value(value);
  }
}

class BluetoothConfigurationWidget extends State<BluetoothConfigurationModal> with TickerProviderStateMixin{
  late HomePageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
  };
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isBluetoothEnabled = widget.isBTEnabled;
      });
      if (_model.isBluetoothEnabled) {
        setState(() {
          _model.isFetchingConnectedDevices = true;
          _model.isFetchingDevices = true;
        });
        _model.fetchedConnectedDevices = await actions.getConnectedDevices();
        setState(() {
          _model.isFetchingConnectedDevices = false;
          _model.connectedDevices =
              _model.fetchedConnectedDevices!.toList().cast<BTDeviceStruct>();
        });
        _model.fetchedDevices = await actions.findDevices();
        setState(() {
          _model.isFetchingDevices = false;
          _model.foundDevices =
              _model.fetchedDevices!.toList().cast<BTDeviceStruct>();
        });
      }
    });
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
              height: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: const Image(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      image: AssetImage('assets/keyboard_buttons/Panel.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Activar Bluetooth',
                              style: TextStyle(color: Colors.white,fontFamily: "Montserrat"),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue ??= widget.isBTEnabled,
                              onChanged: (newValue) async {
                                setState(() => _model.switchValue = newValue!);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor: FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 0.5,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              if (_model.isBluetoothEnabled)
                                Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Dispositivos Conectados',
                                                          style:TextStyle(color: Colors.white,fontFamily: "Montserrat"),
                                                        ),
                                                      ),
                                                      if (_model
                                                          .isFetchingConnectedDevices ??
                                                          true)
                                                        Text(
                                                          'Buscando...',
                                                          style:
                                                          FlutterFlowTheme.of(context)
                                                              .bodySmall,
                                                        ).animateOnPageLoad(animationsMap[
                                                        'textOnPageLoadAnimation1']!),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final displayConnectedDevcies =
                                                      _model.connectedDevices
                                                          .toList();
                                                      if (displayConnectedDevcies
                                                          .isEmpty) {
                                                        return Center(
                                                          child: Container(
                                                            width: double.infinity,
                                                            height: 50.0,
                                                            child: EmptyDevicesWidget(
                                                              text:
                                                              'No connected devices',
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      return ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.vertical,
                                                        itemCount: displayConnectedDevcies
                                                            .length,
                                                        itemBuilder: (context,
                                                            displayConnectedDevciesIndex) {
                                                          final displayConnectedDevciesItem =
                                                          displayConnectedDevcies[
                                                          displayConnectedDevciesIndex];
                                                          return Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0.0, 0.0, 0.0, 12.0),
                                                            child: InkWell(
                                                              splashColor:
                                                              Colors.transparent,
                                                              focusColor:
                                                              Colors.transparent,
                                                              hoverColor:
                                                              Colors.transparent,
                                                              highlightColor:
                                                              Colors.transparent,
                                                              onTap: () async {
                                                                print("hola");
                                                                // context.pushNamed(
                                                                //   'DevicePage',
                                                                //   queryParameters: {
                                                                //     'deviceName':
                                                                //     serializeParam(
                                                                //       displayConnectedDevciesItem
                                                                //           .name,
                                                                //       ParamType.String,
                                                                //     ),
                                                                //     'deviceId':
                                                                //     serializeParam(
                                                                //       displayConnectedDevciesItem
                                                                //           .id,
                                                                //       ParamType.String,
                                                                //     ),
                                                                //     'deviceRssi':
                                                                //     serializeParam(
                                                                //       displayConnectedDevciesItem
                                                                //           .rssi,
                                                                //       ParamType.int,
                                                                //     ),
                                                                //     'hasWriteCharacteristic':
                                                                //     serializeParam(
                                                                //       true,
                                                                //       ParamType.bool,
                                                                //     ),
                                                                //   }.withoutNulls,
                                                                // );
                                                              },
                                                              child: Container(
                                                                width: double.infinity,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent2,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(16.0),
                                                                  border: Border.all(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
                                                                        .secondary,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      16.0,
                                                                      12.0,
                                                                      16.0,
                                                                      12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                            MainAxisSize
                                                                                .min,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .end,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                                                    0.0,
                                                                                    0.0,
                                                                                    8.0,
                                                                                    0.0),
                                                                                child:
                                                                                Text(
                                                                                  displayConnectedDevciesItem
                                                                                      .name,
                                                                                  style: FlutterFlowTheme.of(context)
                                                                                      .bodyLarge,
                                                                                ),
                                                                              ),
                                                                              StrengthIndicatorWidget(
                                                                                key: Key(
                                                                                    'Keywn3_${displayConnectedDevciesIndex}_of_${displayConnectedDevcies.length}'),
                                                                                rssi: displayConnectedDevciesItem
                                                                                    .rssi,
                                                                                color: valueOrDefault<
                                                                                    Color>(
                                                                                      () {
                                                                                    if (displayConnectedDevciesItem.rssi >=
                                                                                        -67) {
                                                                                      return FlutterFlowTheme.of(context).success;
                                                                                    } else if (displayConnectedDevciesItem.rssi >=
                                                                                        -90) {
                                                                                      return FlutterFlowTheme.of(context).warning;
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                    }
                                                                                  }(),
                                                                                  FlutterFlowTheme.of(context)
                                                                                      .success,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child: Text(
                                                                              displayConnectedDevciesItem
                                                                                  .id,
                                                                              style: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .labelSmall,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .arrow_forward_ios_rounded,
                                                                        color: FlutterFlowTheme
                                                                            .of(context)
                                                                            .primaryText,
                                                                        size: 24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 50.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Dispositivos',
                                                            style: TextStyle(color: Colors.white,fontFamily: "Montserrat"),
                                                          ),
                                                        ),
                                                        if (!_model.isFetchingDevices)
                                                          InkWell(
                                                            splashColor:
                                                            Colors.transparent,
                                                            focusColor:
                                                            Colors.transparent,
                                                            hoverColor:
                                                            Colors.transparent,
                                                            highlightColor:
                                                            Colors.transparent,
                                                            onTap: () async {
                                                              setState(() {
                                                                _model.isFetchingConnectedDevices =
                                                                true;
                                                                _model.isFetchingDevices =
                                                                true;
                                                              });
                                                              _model.fetchedConnectedDevicesCopy =
                                                              await actions
                                                                  .getConnectedDevices();
                                                              setState(() {
                                                                _model.isFetchingConnectedDevices =
                                                                false;
                                                                _model.connectedDevices = _model
                                                                    .fetchedConnectedDevices!
                                                                    .toList()
                                                                    .cast<
                                                                    BTDeviceStruct>();
                                                              });
                                                              _model.fetchedDevicesCopy =
                                                              await actions
                                                                  .findDevices();
                                                              setState(() {
                                                                _model.isFetchingDevices =
                                                                false;
                                                                _model.foundDevices = _model
                                                                    .fetchedDevices!
                                                                    .toList()
                                                                    .cast<
                                                                    BTDeviceStruct>();
                                                              });

                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.refresh_rounded,
                                                              color: FlutterFlowTheme.of(
                                                                  context)
                                                                  .secondaryText,
                                                              size: 22.0,
                                                            ),
                                                          ),
                                                        if (_model.isFetchingDevices)
                                                          Text(
                                                            'Escaneando...',
                                                            style: TextStyle(color: Colors.white),
                                                          ).animateOnPageLoad(animationsMap[
                                                          'textOnPageLoadAnimation2']!),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final displayDevices =
                                                        _model.foundDevices.toList();
                                                        if (displayDevices.isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: 50.0,
                                                              child: EmptyDevicesWidget(
                                                                text: 'No devices found',
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          itemCount:
                                                          displayDevices.length,
                                                          itemBuilder: (context,
                                                              displayDevicesIndex) {
                                                            final displayDevicesItem =
                                                            displayDevices[
                                                            displayDevicesIndex];
                                                            return Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 0.0,
                                                                  0.0, 12.0),
                                                              child: InkWell(
                                                                splashColor:
                                                                Colors.transparent,
                                                                focusColor:
                                                                Colors.transparent,
                                                                hoverColor:
                                                                Colors.transparent,
                                                                highlightColor:
                                                                Colors.transparent,
                                                                onTap: () async {
                                                                  _model.hasWrite =
                                                                  await actions
                                                                      .connectDevice(
                                                                    displayDevicesItem,
                                                                  );
                                                                  setState(() {
                                                                    _model.addToConnectedDevices(
                                                                        displayDevicesItem);
                                                                  });

                                                                  // context.pushNamed(
                                                                  //   'DevicePage',
                                                                  //   queryParameters: {
                                                                  //     'deviceName':
                                                                  //     serializeParam(
                                                                  //       displayDevicesItem
                                                                  //           .name,
                                                                  //       ParamType.String,
                                                                  //     ),
                                                                  //     'deviceId':
                                                                  //     serializeParam(
                                                                  //       displayDevicesItem
                                                                  //           .id,
                                                                  //       ParamType.String,
                                                                  //     ),
                                                                  //     'deviceRssi':
                                                                  //     serializeParam(
                                                                  //       displayDevicesItem
                                                                  //           .rssi,
                                                                  //       ParamType.int,
                                                                  //     ),
                                                                  //     'hasWriteCharacteristic':
                                                                  //     serializeParam(
                                                                  //       _model.hasWrite,
                                                                  //       ParamType.bool,
                                                                  //     ),
                                                                  //   }.withoutNulls,
                                                                  // );

                                                                  setState(() {});
                                                                },
                                                                child: Container(
                                                                  width: double.infinity,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: FlutterFlowTheme
                                                                        .of(context)
                                                                        .accent2,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        16.0),
                                                                    border: Border.all(
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .secondary,
                                                                      width: 1.0,
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize
                                                                                  .max,
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                      0.0,
                                                                                      0.0,
                                                                                      8.0,
                                                                                      0.0),
                                                                                  child:
                                                                                  Text(
                                                                                    displayDevicesItem
                                                                                        .name,
                                                                                    style:
                                                                                    TextStyle(color: Colors.cyan,fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 16),
                                                                                  ),
                                                                                ),
                                                                                StrengthIndicatorWidget(
                                                                                  key: Key(
                                                                                      'Keybdj_${displayDevicesIndex}_of_${displayDevices.length}'),
                                                                                  rssi: displayDevicesItem
                                                                                      .rssi,
                                                                                  color: valueOrDefault<
                                                                                      Color>(
                                                                                        () {
                                                                                      if (displayDevicesItem.rssi >=
                                                                                          -67) {
                                                                                        return FlutterFlowTheme.of(context).success;
                                                                                      } else if (displayDevicesItem.rssi >=
                                                                                          -90) {
                                                                                        return FlutterFlowTheme.of(context).warning;
                                                                                      } else {
                                                                                        return FlutterFlowTheme.of(context).error;
                                                                                      }
                                                                                    }(),
                                                                                    FlutterFlowTheme.of(context)
                                                                                        .success,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  0.0,
                                                                                  5.0,
                                                                                  0.0,
                                                                                  0.0),
                                                                              child: Text(
                                                                                displayDevicesItem
                                                                                    .id,
                                                                                style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .labelSmall,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primaryText,
                                                                          size: 24.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              if (!_model.isBluetoothEnabled)
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Turn on bluetooth to connect with any device',
                                      style: FlutterFlowTheme.of(context).labelMedium,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );});;
  }

}