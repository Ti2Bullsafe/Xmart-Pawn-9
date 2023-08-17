import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:serial_app/entities/abrir_sistemas/abrir_sistemas_routes.dart';
import 'package:serial_app/entities/configuracion/configuracion_routes.dart';
import 'package:serial_app/entities/estado_del_sistema/estado_del_sistema_routes.dart';
import 'package:serial_app/entities/pantalla_principal/pantalla_principal_routes.dart';
import 'package:serial_app/routes.dart';
import 'package:serial_app/shared/utilities/bloc/utilities_bloc.dart';
import 'package:serial_app/shared/utilities/load_screen.dart';


class JhipsterFlutterSampleAppApp extends StatelessWidget {
  const JhipsterFlutterSampleAppApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bull Safe',
      routes: {
        JhipsterFlutterSampleAppRoutes.index: (context) {
          return BlocProvider<UtilitiesBloc>(
            create: (context) => UtilitiesBloc(),
            child: LoadScreen());
        },
        ...PantallaPrincipalRoutes.map,
        ...AbrirSistemasRoutes.map,
        ...ConfiguracionRoutes.map,
        ...EstadoDelSistemaRoutes.map
        // jhipster-merlin-needle-route-add - JHipster will add new routes here
      },
      localizationsDelegates:  const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

    );
  }
}
