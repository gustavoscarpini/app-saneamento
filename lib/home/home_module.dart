import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => HomeRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => HomePage()),
      ];
}
