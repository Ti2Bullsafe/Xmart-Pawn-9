part of 'utilities_bloc.dart';

abstract class UtilitiesEvent extends Equatable {
  const UtilitiesEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FormSubmitted extends UtilitiesEvent {}
