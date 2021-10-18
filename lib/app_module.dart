import 'package:appcontribuinte/certidoes/certidao_module.dart';
import 'package:appcontribuinte/config/config_module.dart';
import 'package:appcontribuinte/debitos/debito_module.dart';
import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:appcontribuinte/empresas/empresa_module.dart';
import 'package:appcontribuinte/home/home_module.dart';
import 'package:appcontribuinte/imoveis/imovel_module.dart';
import 'package:appcontribuinte/login/login_module.dart';
import 'package:appcontribuinte/perfil/perfil_module.dart';
import 'package:appcontribuinte/protocolos/protocolo_module.dart';
import 'package:appcontribuinte/register/cadastro_usuario_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  static Inject get to => Inject<AppModule>.of();
  Dio client = CustomDio(true).dio;

  @override
  List<Bind> get binds => [
        Bind((i) => client),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/imovel', module: ImovelModule()),
        ModularRouter('/empresa', module: EmpresaModule()),
        ModularRouter('/protocolo', module: ProtocoloModule()),
        ModularRouter('/debito', module: DebitoModule()),
        ModularRouter('/configuracao', module: ConfigModule()),
        ModularRouter('/register', module: CadastroUsuarioModule()),
        ModularRouter('/certidao', module: CertidaoModule()),
        ModularRouter('/perfil', module: PerfilModule()),
      ];
}
