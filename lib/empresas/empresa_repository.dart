import 'dart:convert';
import 'dart:io';

import 'package:appcontribuinte/constants.dart';
import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/empresa.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class EmpresaRepository {
  final Dio _client;

  EmpresaRepository(this._client);

  Future<List<Empresa>> consultarPorCPF(String cpf) async {
    try {
      var response = await _client
          .get("/api/tributario/empresas/${CPFValidator.strip(cpf)}");
      return (response.data as List)
          .map((item) => Empresa.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<Alvara>> consultarAlvaras(String cpf, String inscricao) async {
    try {
      var response = await _client.get(
          "/api/tributario/alvaras/${CPFValidator.strip(cpf)}/${inscricao}");
      print("response ${response.data}");
      return (response.data as List)
          .map((item) => Alvara.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future imprimirCadastro(String cpf, String inscricao) async {
    try {
      var response = await _client.get(
          "/api/tributario/imprimir-empresa/${CPFValidator.strip(cpf)}/${inscricao}");
      if (response.data == null) {
        return;
      }
      var bytes =
          base64Decode(response.data.replaceAll('\n', '').replaceAll('\"', ''));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path + "/BCE-$inscricao.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(bytes);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future imprimirAlvara(String cpf, int alvara) async {
    try {
      var response = await _client.get(
          "/api/tributario/imprimir-alvara/${CPFValidator.strip(cpf)}/${alvara}");
      if (response.data == null) {
        return;
      }
      var bytes =
          base64Decode(response.data.replaceAll('\n', '').replaceAll('\"', ''));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path + "/Alvara-$alvara.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(bytes);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }
}
