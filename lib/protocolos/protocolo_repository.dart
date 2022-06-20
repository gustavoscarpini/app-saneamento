import 'dart:convert';
import 'dart:io';

import 'package:appcontribuinte/constants.dart';
import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/protocolo.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ProtocoloRepository {
  final Dio _client;

  ProtocoloRepository(this._client);

  Future<List<Protocolo>> consultarPorCPF(String? cpf) async {
    try {
      var response = await _client
          .get("/api/tributario/protocolos/${CPFValidator.strip(cpf)}");
      return (response.data as List)
          .map((item) => Protocolo.fromJson(item))
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

  Future imprimir(int? numero, int? ano) async {
    try {
      var response = await _client.get(
          "/api/tributario/imprimir-protocolo/$numero/$ano");
      if (response.data == null) {
        return;
      }
      var bytes =
          base64Decode(response.data.replaceAll('\n', '').replaceAll('\"', ''));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path + "/Protocolo-$numero-$ano.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(bytes);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }
}
