part of 'utilities_bloc.dart';

class UtilitiesState extends Equatable {

  final String generalErrorKey;

  static final String authenticationFailKey = 'error.authenticate';

  const UtilitiesState({
    this.generalErrorKey = "Error Http"
    // this.generalErrorKey = HttpUtils.generalNoErrorKey
  });

  UtilitiesState copyWith({

    String? generalErrorKey
  }) {
    return UtilitiesState(
      generalErrorKey: generalErrorKey ?? this.generalErrorKey,
    );
  }

  @override
  List<Object> get props => [generalErrorKey];

  @override
  bool get stringify => true;
}
