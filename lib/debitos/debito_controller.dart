import 'dart:convert';
import 'dart:typed_data';
import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/debito.dart';
import 'package:appcontribuinte/domains/pix.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'debito_repository.dart';

part 'debito_controller.g.dart';

class DebitoController = _DebitoControllerBase with _$DebitoController;

abstract class _DebitoControllerBase with Store {
  final DebitoRepository repo;

  _DebitoControllerBase(
    this.repo,
  );

  @observable
  ObservableList<Debito> debitos = ObservableList();

  @observable
  ObservableList<Alvara> alvaras = ObservableList();

  @observable
  ObservableList<Map<Debito, Pix>> qrCodes = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  Usuario? user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    debitos.clear();
    repo.consultarPorCPF(user!.pessoa!.cpfCnpj).then((value) {
      debitos.addAll(value);
      isLoading = false;
    });
  }

  @action
  Future imprimir(Debito debito) async {
    isLoading = true;
    repo.imprimir(debito).then((value) {
      isLoading = false;
    });
  }

  @action
  Future gerarQrCodePix(Debito debito) async {
    isLoading = true;
    qrCodes.clear();
    repo.gerarQrCodePix(debito).then((pix) {
      qrCodes.add({debito : pix});
      isLoading = false;
    });
  }

  @action
  Uint8List imageFromBase64String(String base64String) {
    return base64Decode(base64String);
  }
}
