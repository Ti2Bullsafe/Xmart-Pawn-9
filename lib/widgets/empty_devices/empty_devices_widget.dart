import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_devices_model.dart';
export 'empty_devices_model.dart';

class EmptyDevicesWidget extends StatefulWidget {
  const EmptyDevicesWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  _EmptyDevicesWidgetState createState() => _EmptyDevicesWidgetState();
}

class _EmptyDevicesWidgetState extends State<EmptyDevicesWidget> {
  late EmptyDevicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDevicesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.text!,
          style: TextStyle(color: Colors.white38,fontFamily: "Montserrat"),
        ),
      ),
    );
  }
}
