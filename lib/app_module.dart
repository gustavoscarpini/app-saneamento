import 'package:appcontribuinte/certidoes/certidao_module.dart';
import 'package:appcontribuinte/config/config_module.dart';
import 'package:appcontribuinte/debitos/debito_module.dart';
import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:appcontribuinte/empresas/empresa_module.dart';
import 'package:appcontribuinte/home/home_module.dart';
import 'package:appcontribuinte/imoveis/imovel_module.dart';
import 'package:appcontribuinte/itbi/itbi_module.dart';
import 'package:appcontribuinte/login/login_module.dart';
import 'package:appcontribuinte/perfil/perfil_module.dart';
import 'package:appcontribuinte/protocolos/protocolo_module.dart';
import 'package:appcontribuinte/register/cadastro_usuario_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends Module {
  Dio client = CustomDio().dio;

  @override
  List<Bind> get binds => [
        Bind((i) => client),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/imovel', module: ImovelModule()),
        ModuleRoute('/empresa', module: EmpresaModule()),
        ModuleRoute('/protocolo', module: ProtocoloModule()),
        ModuleRoute('/debito', module: DebitoModule()),
        ModuleRoute('/configuracao', module: ConfigModule()),
        ModuleRoute('/register', module: CadastroUsuarioModule()),
        ModuleRoute('/certidao', module: CertidaoModule()),
        ModuleRoute('/itbi', module: ItbiModule()),
        ModuleRoute('/perfil', module: PerfilModule()),
      ];
}
