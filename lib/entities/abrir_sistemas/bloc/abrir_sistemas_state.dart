part of 'abrir_sistemas_bloc.dart';

class AbrirSistemasState extends Equatable {

  final String generalErrorKey;

  static final String authenticationFailKey = 'error.authenticate';

  const AbrirSistemasState({
    this.generalErrorKey = "Error Http"
    // this.generalErrorKey = HttpUtils.generalNoErrorKey
  });

  AbrirSistemasState copyWith({

    String? generalErrorKey
  }) {
    return AbrirSistemasState(
      generalErrorKey: generalErrorKey ?? this.generalErrorKey,
    );
  }

  @override
  List<Object> get props => [generalErrorKey];

  @override
  bool get stringify => true;
}
