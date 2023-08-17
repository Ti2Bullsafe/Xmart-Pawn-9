import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/configuracion_bloc.dart';
import 'configuracion.dart';

class ConfiguracionRoutes {
  static final view = '/configuracion/configuracion';
  static const viewScreenKey = Key('__abrir_sistemas__');

  static final map = <String, WidgetBuilder>{
    view: (context) {
      return BlocProvider<ConfiguracionBloc>(
          create: (context) => ConfiguracionBloc(),
          child: const Configuracion(title: 'abrir sistemas',));
    }
  };
}
