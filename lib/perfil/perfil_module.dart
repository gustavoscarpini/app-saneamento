import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'perfil_controller.dart';
import 'perfil_page.dart';
import 'perfil_repository.dart';

class PerfilModule extends ChildModule {
  static Inject get to => Inject<PerfilModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => PerfilController(i.get<PerfilRepository>())),
        Bind((i) => PerfilRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => PerfilPage()),
      ];
}
