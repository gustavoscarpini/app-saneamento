import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Foto {
  String? foto;
  String? mime;
  String? nome;
  File? file;

  Foto({this.foto, this.mime, this.nome});

  Foto.fromJson(Map<String, dynamic> json) {
    foto = json['foto'];
    mime = json['mime'];
    nome = json['nome'];
    carregarImagem();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foto'] = this.foto;
    data['mime'] = this.mime;
    data['nome'] = this.nome;
    return data;
  }

  void carregarImagem() {
    print(foto);
    print(mime);
    if (foto != null && foto!.isNotEmpty) {
      String base = foto!.contains(",") ? foto!.split(",")[1] : foto!;
      final decodedBytes = base64Decode(base);
      (getApplicationDocumentsDirectory()).then((value) {
        print("value ::::: $value");
        String dir = value.path;
        print("dir ::::: $dir");
        file = File("$dir/" +
            DateTime.now().millisecondsSinceEpoch.toString() +
            (mime!.contains("/") ? "." + mime!.split("/")[1] : "jpeg"));
        file!.writeAsBytes(decodedBytes).then((value) {
          print("file ::::: $dir");
        });

      });
    }
  }
}
