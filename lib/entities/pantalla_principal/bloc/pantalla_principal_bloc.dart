import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

part 'pantalla_principal_events.dart';
part 'pantalla_principal_state.dart';

class PantallaPrincipalBloc extends Bloc<PantallaPrincipalEvent, PantallaPrincipalState> {
  PantallaPrincipalBloc() : super(const PantallaPrincipalState());



  @override
  void onTransition(Transition<PantallaPrincipalEvent, PantallaPrincipalState> transition) {
    super.onTransition(transition);
  }

}
