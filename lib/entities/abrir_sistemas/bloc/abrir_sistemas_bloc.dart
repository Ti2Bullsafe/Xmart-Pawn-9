import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

part 'abrir_sistemas_events.dart';
part 'abrir_sistemas_state.dart';

class AbrirSistemasBloc extends Bloc<AbrirSistemasEvent, AbrirSistemasState> {
  AbrirSistemasBloc() : super(const AbrirSistemasState());



  @override
  void onTransition(Transition<AbrirSistemasEvent, AbrirSistemasState> transition) {
    super.onTransition(transition);
  }

}
