import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login.page.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<LoginRepository>())),
        Bind((i) => LoginRepository(new CustomDio().dio))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => LoginPage()),
      ];
}
