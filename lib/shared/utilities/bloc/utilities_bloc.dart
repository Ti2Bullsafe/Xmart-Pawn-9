import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

part 'utilities_events.dart';
part 'utilities_state.dart';

class UtilitiesBloc extends Bloc<UtilitiesEvent, UtilitiesState> {
  UtilitiesBloc() : super(const UtilitiesState());



  @override
  void onTransition(Transition<UtilitiesEvent, UtilitiesState> transition) {
    super.onTransition(transition);
  }

}
