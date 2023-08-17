part of 'estado_del_sistema_bloc.dart';

class EstadoDelSistemaState extends Equatable {
  final BoxGateDataModel boxGateDataModel;
  final DrawersDataModel drawersDataModel;

  const EstadoDelSistemaState({
    this.boxGateDataModel =
        const BoxGateDataModel(null, null, null, null, null, null),
    this.drawersDataModel =
        const DrawersDataModel(null, null, null, null, null, null),
  });

  EstadoDelSistemaState copyWith(
      {BoxGateDataModel? boxGateDataModel,
      DrawersDataModel? drawersDataModel}) {
    return EstadoDelSistemaState(
      boxGateDataModel: boxGateDataModel ?? this.boxGateDataModel,
      drawersDataModel: drawersDataModel ?? this.drawersDataModel,
    );
  }

  @override
  List<Object> get props => [boxGateDataModel, drawersDataModel];

  @override
  bool get stringify => true;
}
