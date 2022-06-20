import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'itbi_controller.dart';
import 'itbi_page.dart';
import 'itbi_repository.dart';

class ItbiModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) => ItbiController(i.get<ItbiRepository>())),
        Bind((i) => ItbiRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => ItbiPage()),
      ];
}
