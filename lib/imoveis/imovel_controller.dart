import 'package:appcontribuinte/domains/imovel.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'imovel_repository.dart';

part 'imovel_controller.g.dart';

class ImovelController = _ImovelControllerBase with _$ImovelController;

abstract class _ImovelControllerBase with Store {
  final ImovelRepository repo;

  _ImovelControllerBase(
    this.repo,
  );

  @observable
  ObservableList<Imovel> imoveis = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  Usuario? user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    imoveis.clear();
    repo.consultarPorCPF(user!.pessoa!.cpfCnpj).then((value) {
      imoveis.addAll(value);
      isLoading = false;
    });
  }

  @action
  Future imprimir(int? id) async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    repo.imprimir(id).then((value) {

      print("CHEGOUUUUU ${value}");

      isLoading = false;
    });
  }

}
