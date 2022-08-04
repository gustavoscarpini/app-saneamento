import 'package:appcontribuinte/domains/util.dart';

class Register {
  int? id;
  String? nome;
  String? cpf;
  String? email;
  String? nomeMae;
  String? mensagem;
  DateTime? nascimento;
  bool? usuario;

  Register(
      {this.id,
      this.nome,
      this.cpf,
      this.email,
      this.nomeMae,
      this.nascimento,
      this.usuario =false,
      this.mensagem});

  Register.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    nomeMae = json['nomeMae'];
    if (json['nascimento'] != null) {
      nascimento = Util.serverSideFormart.parse(json['nascimento']);
    }
    mensagem = json['mensagem'];
    usuario = json['usuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['nomeMae'] = this.nomeMae;
    data['nascimento'] = Util.serverSideFormart.format(this.nascimento!);
    data['mensagem'] = this.mensagem;
    data['usuario'] = this.usuario;
    return data;
  }
}
