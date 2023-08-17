part of 'configuracion_bloc.dart';

class ConfiguracionState extends Equatable {

  final String generalErrorKey;

  static final String authenticationFailKey = 'error.authenticate';

  const ConfiguracionState({
    this.generalErrorKey = "Error Http"
    // this.generalErrorKey = HttpUtils.generalNoErrorKey
  });

  ConfiguracionState copyWith({

    String? generalErrorKey
  }) {
    return ConfiguracionState(
      generalErrorKey: generalErrorKey ?? this.generalErrorKey,
    );
  }

  @override
  List<Object> get props => [generalErrorKey];

  @override
  bool get stringify => true;
}
