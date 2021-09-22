import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'empresa_controller.dart';
import 'empresa_page.dart';
import 'empresa_repository.dart';

class EmpresaModule extends ChildModule {
  static Inject get to => Inject<EmpresaModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => EmpresaController(i.get<EmpresaRepository>())),
        Bind((i) => EmpresaRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => EmpresaPage()),
      ];
}
