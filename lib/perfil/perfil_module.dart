import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:appcontribuinte/login/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'perfil_controller.dart';
import 'perfil_page.dart';
import 'perfil_repository.dart';

class PerfilModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) => PerfilController(i.get<PerfilRepository>(), i.get<LoginRepository>())),
        Bind((i) => PerfilRepository(i.get<Dio>())),
        Bind((i) => LoginRepository(new CustomDio().dio))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => PerfilPage()),
      ];
}
