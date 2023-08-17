


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/estado_del_sistema_bloc.dart';
import 'estado_del_sistema.dart';

class EstadoDelSistemaRoutes {
  static final view = '/estado_del_sistema/estado_del_sistema';
  static const viewScreenKey = Key('__estado_del_sistema__');

  static final map = <String, WidgetBuilder>{
    view: (context) {
      return BlocProvider<EstadoDelSistemaBloc>(
          create: (context) => EstadoDelSistemaBloc()..add( LoadBoxGateData()),
          child: EstadoDelSistema(title: 'estado del sistema',));
    }
  };
}
