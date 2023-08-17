part of 'estado_del_sistema_bloc.dart';


abstract class EstadoDelSistemaEvent extends Equatable {
  const EstadoDelSistemaEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadBoxGateData extends EstadoDelSistemaEvent {
  const LoadBoxGateData();
  @override
  List<Object> get props => [];
}

class FormSubmitted extends EstadoDelSistemaEvent {}
