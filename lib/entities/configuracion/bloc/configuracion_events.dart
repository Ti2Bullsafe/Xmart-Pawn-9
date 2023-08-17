part of 'configuracion_bloc.dart';


abstract class ConfiguracionEvent extends Equatable {
  const ConfiguracionEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FormSubmitted extends ConfiguracionEvent {}
