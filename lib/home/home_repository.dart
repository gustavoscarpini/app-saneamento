import 'dart:developer';

import 'package:dio/dio.dart';

import '../domains/solciticar_dispositivo.dart';

class HomeRepository {
  final Dio _client;

  HomeRepository(this._client);

  Future<SolicitacaoDispositivo> solicitarAcessoAoDispositivo(String? cpf, dispositivo) async {
    try {
      var response =
          await _client.get("/auth/solicitar-dispositivo?dispositivo=$dispositivo&cpf=$cpf");
      print("response ${response.data}");
      return SolicitacaoDispositivo.fromJson(response.data);
    } on DioError catch (e) {
      log("deu chabulicó $e");
      throw e;
    }
  }

  Future<bool> confirmarAcessoAoDispositivo(String? cpf, dispositivo, codigo) async {
    try {
      var response =
          await _client.get("/auth/confirmar-dispositivo?dispositivo=$dispositivo&cpf=$cpf&codigo=$codigo");
      return true;
    } on DioError catch (e) {
      log("deu chabulicó $e");
      return false;
    }
  }
}
