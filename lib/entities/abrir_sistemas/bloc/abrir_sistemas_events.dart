part of 'abrir_sistemas_bloc.dart';


abstract class AbrirSistemasEvent extends Equatable {
  const AbrirSistemasEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FormSubmitted extends AbrirSistemasEvent {}
