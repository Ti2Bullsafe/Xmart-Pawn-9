import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

part 'configuracion_events.dart';
part 'configuracion_state.dart';

class ConfiguracionBloc extends Bloc<ConfiguracionEvent, ConfiguracionState> {
  ConfiguracionBloc() : super(const ConfiguracionState());



  @override
  void onTransition(Transition<ConfiguracionEvent, ConfiguracionState> transition) {
    super.onTransition(transition);
  }

}
