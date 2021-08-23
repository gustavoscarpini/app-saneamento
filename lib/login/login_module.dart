import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login.page.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            LoginController(i.get<LoginRepository>())),
        Bind((i) => LoginRepository(i.get<Dio>())),
        Bind((i) => Dio())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
