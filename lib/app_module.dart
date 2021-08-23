import 'package:appcontribuinte/config/config_module.dart';
import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:appcontribuinte/home/home_module.dart';
import 'package:appcontribuinte/login/login_module.dart';
import 'package:appcontribuinte/login/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  static Inject get to => Inject<AppModule>.of();
  Dio client = CustomDio().dio;

  @override
  List<Bind> get binds => [
        Bind((i) => LoginRepository(client)),
        Bind((i) => client),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/configuracao', module: ConfigModule()),
      ];
}
