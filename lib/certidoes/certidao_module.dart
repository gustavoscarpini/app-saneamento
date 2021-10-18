import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'certidao_controller.dart';
import 'certidao_page.dart';
import 'certidao_repository.dart';

class CertidaoModule extends ChildModule {
  static Inject get to => Inject<CertidaoModule>.of();

  @override
  List<Bind> get binds => [
        Bind((i) => CertidaoController(i.get<CertidaoRepository>())),
        Bind((i) => CertidaoRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => CertidaoPage()),
      ];
}
