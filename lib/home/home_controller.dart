import 'package:appcontribuinte/domains/solciticar_dispositivo.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:device_information/device_information.dart';
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
    const Opcao(
        titulo: 'Empresas', icon: Icons.business_sharp, rota: "empresa"),
    const Opcao(titulo: 'Imóveis', icon: Icons.home, rota: "imovel"),
    const Opcao(titulo: 'Protocolos', icon: Icons.list_alt, rota: "protocolo"),
    const Opcao(titulo: 'Débitos', icon: Icons.attach_money, rota: "debito"),
    const Opcao(
        titulo: 'Certidões', icon: Icons.file_copy_outlined, rota: "certidao"),
    const Opcao(
        titulo: 'ITBI', icon: Icons.account_balance_outlined, rota: "itbi"),
    // const Opcao(titulo: 'Notas Avulsas', icon: Icons.file_present, rota:"nota-avulsa"),
    // const Opcao(titulo: 'Aut. Documentos', icon: Icons.fact_check_outlined, rota:"autenticacao"),
    // const Opcao(titulo: 'Notas Recebibas', icon: Icons.upload_file, rota:"nota-recebida"),
  ];

  _HomeControllerBase(
    this.repo,
  );

  @observable
  bool isLoading = false;

  @observable
  bool validouCodigo = false;

  @observable
  Usuario? user;

  @observable
  SolicitacaoDispositivo? solicitacaoDispositivo;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    isLoading = false;
  }

  @action
  Future solicitarAcessoAoDispositivo() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    String deviceName = await getDeviceId();
    solicitacaoDispositivo = await this
        .repo
        .solicitarAcessoAoDispositivo(user!.pessoa!.cpfCnpj, deviceName);
    isLoading = false;
  }

  Future<String> getDeviceId() async => await DeviceInformation.deviceModel + " (" +await DeviceInformation.deviceName + ")";

  @action
  Future confirmarDispositivo(String codigo) async {
    isLoading = true;
    String deviceName = await getDeviceId();
    validouCodigo = await this.repo.confirmarAcessoAoDispositivo(
        user!.pessoa!.cpfCnpj, deviceName, codigo);
    isLoading = false;
  }
}

class Opcao {
  const Opcao({this.titulo, this.icon, this.rota});

  final String? titulo;
  final String? rota;
  final IconData? icon;
}
