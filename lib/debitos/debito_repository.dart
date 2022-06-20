import 'dart:convert';
import 'dart:io';

import 'package:appcontribuinte/domains/debito.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DebitoRepository {
  final Dio _client;

  DebitoRepository(this._client);

  Future<List<Debito>> consultarPorCPF(String? cpf) async {
    try {
      var response = await _client
          .get("/api/tributario/debitos/${CPFValidator.strip(cpf)}");
      return (response.data as List)
          .map((item) => Debito.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future imprimir(Debito debito) async {
    try {
      var response =
          await _client.post("/api/tributario/imprimir-debito/", data: debito);
      if (response.data == null) {
        return;
      }
      var bytes =
          base64Decode(response.data.replaceAll('\n', '').replaceAll('\"', ''));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path + "/GUIA-${debito.idParcela}.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(bytes);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }
}
