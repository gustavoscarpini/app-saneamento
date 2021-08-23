import 'package:appcontribuinte/domains/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repo;

  List<Opcao> opcoes = const <Opcao>[
    const Opcao(titulo: 'Empresas', icon: Icons.business_sharp),
    const Opcao(titulo: 'Imóveis', icon: Icons.home),
    const Opcao(titulo: 'Protocolos', icon: Icons.list_alt),
    const Opcao(titulo: 'Débitos', icon: Icons.attach_money),
    const Opcao(titulo: 'Certidões', icon: Icons.file_copy_outlined),
    const Opcao(titulo: 'ITBI', icon: Icons.account_balance_outlined),
    const Opcao(titulo: 'Notas Avulsas', icon: Icons.file_present),
    const Opcao(titulo: 'Aut. Documentos', icon: Icons.fact_check_outlined),
    const Opcao(titulo: 'Notas Recebibas', icon: Icons.upload_file),
  ];

  _HomeControllerBase(
    this.repo,
  );

  @observable
  bool isLoading = false;

  @observable
  Usuario user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    isLoading = false;
  }
}

class Opcao {
  const Opcao({this.titulo, this.icon});

  final String titulo;
  final IconData icon;
}
