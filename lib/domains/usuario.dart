import 'package:appcontribuinte/domains/pessoa.dart';

class Usuario {
  Pessoa pessoa;
  String token;

  Usuario({this.pessoa, this.token});

  Usuario.fromJson(Map<String, dynamic> json) {
    pessoa =
        json['pessoa'] != null ? new Pessoa.fromJson(json['pessoa']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pessoa != null) {
      data['pessoa'] = this.pessoa.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
