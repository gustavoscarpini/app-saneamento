import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'imovel_controller.dart';
import 'imovel_page.dart';
import 'imovel_repository.dart';

class ImovelModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) => ImovelController(i.get<ImovelRepository>())),
        Bind((i) => ImovelRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => ImovelPage()),
      ];
}
