


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pantalla_principal_bloc.dart';
import 'pantalla_principal.dart';

class PantallaPrincipalRoutes {
  static final view = '/account/login_screen';
  static const viewScreenKey = Key('__loginScreen__');

  static final map = <String, WidgetBuilder>{
    view: (context) {
      return BlocProvider<PantallaPrincipalBloc>(
          create: (context) => PantallaPrincipalBloc(),
          child: const PantallaPrincipal(title: 'Pantalla Inicial',));
    }
  };
}
