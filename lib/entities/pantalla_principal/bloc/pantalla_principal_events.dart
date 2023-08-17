part of 'pantalla_principal_bloc.dart';


abstract class PantallaPrincipalEvent extends Equatable {
  const PantallaPrincipalEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FormSubmitted extends PantallaPrincipalEvent {}
