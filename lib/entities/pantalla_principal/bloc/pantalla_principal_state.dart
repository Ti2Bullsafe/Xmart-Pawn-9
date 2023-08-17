part of 'pantalla_principal_bloc.dart';

class PantallaPrincipalState extends Equatable {

  final String generalErrorKey;

  static final String authenticationFailKey = 'error.authenticate';

  const PantallaPrincipalState({
    this.generalErrorKey = "Error Http"
    // this.generalErrorKey = HttpUtils.generalNoErrorKey
  });

  PantallaPrincipalState copyWith({

    String? generalErrorKey
  }) {
    return PantallaPrincipalState(
      generalErrorKey: generalErrorKey ?? this.generalErrorKey,
    );
  }

  @override
  List<Object> get props => [generalErrorKey];

  @override
  bool get stringify => true;
}
