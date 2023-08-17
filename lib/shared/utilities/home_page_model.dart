import '../../backend/schema/structs/b_t_device_struct.dart';
import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_model.dart';

class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isFetchingDevices = false;

  bool isBluetoothEnabled = false;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  List<BTDeviceStruct> connectedDevices = [];
  void addToConnectedDevices(BTDeviceStruct item) => connectedDevices.add(item);
  void removeFromConnectedDevices(BTDeviceStruct item) =>
      connectedDevices.remove(item);
  void removeAtIndexFromConnectedDevices(int index) =>
      connectedDevices.removeAt(index);
  void updateConnectedDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connectedDevices[index] = updateFn(connectedDevices[index]);

  bool? isFetchingConnectedDevices = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getConnectedDevices] action in HomePage widget.
  List<BTDeviceStruct>? fetchedConnectedDevices;
  // Stores action output result for [Custom Action - findDevices] action in HomePage widget.
  List<BTDeviceStruct>? fetchedDevices;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - getConnectedDevices] action in Icon widget.
  List<BTDeviceStruct>? fetchedConnectedDevicesCopy;
  // Stores action output result for [Custom Action - findDevices] action in Icon widget.
  List<BTDeviceStruct>? fetchedDevicesCopy;
  // Stores action output result for [Custom Action - connectDevice] action in ScannedDeviceTile widget.
  bool? hasWrite;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
