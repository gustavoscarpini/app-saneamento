import 'dart:convert';
import 'dart:io';

import 'package:appcontribuinte/domains/certidao.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CertidaoRepository {
  final Dio _client;

  CertidaoRepository(this._client);

  Future<List<Certidao>> consultarPorCPF(String cpf, int first) async {
    try {
      var response = await _client
          .get("/api/tributario/certidoes/${CPFValidator.strip(cpf)}?first=$first");
      return (response.data as List)
          .map((item) => Certidao.fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e);
      return List.empty();
    }
  }

  Future imprimir(Certidao certidao) async {
    try {
      var response =
          await _client.get("/api/tributario/imprimir-certidao/${certidao.id}");
      if (response.data == null) {
        return;
      }
      var bytes =
          base64Decode(response.data.replaceAll('\n', '').replaceAll('\"', ''));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path + "/Certidao-${certidao.codigo}.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(bytes);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }
}
