import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:serial_app/entities/estado_del_sistema/estado_del_sistema_cajones_model.dart';
import 'package:serial_app/entities/estado_del_sistema/estado_del_sistema_model.dart';
import 'package:serial_app/shared/utilities/constants/constants.dart';

part 'estado_del sistema_events.dart';
part 'estado_del_sistema_state.dart';

class EstadoDelSistemaBloc extends Bloc<EstadoDelSistemaEvent, EstadoDelSistemaState> {
  EstadoDelSistemaBloc() : super(const EstadoDelSistemaState()){
    on<LoadBoxGateData>(onLoadBoxGateData);
  }



  @override
  void onTransition(Transition<EstadoDelSistemaEvent, EstadoDelSistemaState> transition) {
    super.onTransition(transition);
  }


   onLoadBoxGateData(LoadBoxGateData event, Emitter<EstadoDelSistemaState> emit)async {
     String boxGateData = await readDataFromCache("boxGateData");
     String drawersData = await readDataFromCache("drawersData");
     if(boxGateData != "NOT_FOUND"){
       BoxGateDataModel boxGateDataModel = BoxGateDataModel.fromJson(jsonDecode(boxGateData));
       emit(state.copyWith(boxGateDataModel: boxGateDataModel));
       print(boxGateDataModel.estado);
     }
      if(drawersData != "NOT_FOUND"){
        DrawersDataModel drawersDataModel = DrawersDataModel.fromJson(jsonDecode(drawersData));
        emit(state.copyWith(drawersDataModel: drawersDataModel));
        print(drawersDataModel.estado);
      }
  }

}
