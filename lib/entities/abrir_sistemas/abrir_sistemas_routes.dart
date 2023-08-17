


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/abrir_sistemas_bloc.dart';
import 'abrir_sistemas.dart';

class AbrirSistemasRoutes {
  static final view = '/abrir_sistemas/abrir_sistemas';
  static const viewScreenKey = Key('__abrir_sistemas__');

  static final map = <String, WidgetBuilder>{
    view: (context) {
      return BlocProvider<AbrirSistemasBloc>(
          create: (context) => AbrirSistemasBloc(),
          child: const AbrirSistemas(title: 'abrir sistemas',));
    }
  };
}
