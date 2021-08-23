import 'package:appcontribuinte/domains/foto.dart';

class Pessoa {
  int id;
  String nome;
  String tipo;
  String situacaoCadastralPessoa;
  String rgInscricao;
  String orgaoEmissor;
  String cpfCnpj;
  String email;
  Foto foto;

  Pessoa(
      {this.tipo,
      this.nome,
      this.situacaoCadastralPessoa,
      this.rgInscricao,
      this.orgaoEmissor,
      this.id,
      this.cpfCnpj,
      this.foto,
      this.email});

  Pessoa.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    nome = json['nome'];
    situacaoCadastralPessoa = json['situacaoCadastralPessoa'];
    rgInscricao = json['rgInscricao'];
    orgaoEmissor = json['orgaoEmissor'];
    id = json['id'];
    cpfCnpj = json['cpfCnpj'];
    email = json['email'];
    foto = json['foto'] != null ? new Foto.fromJson(json['foto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['nome'] = this.nome;
    data['situacaoCadastralPessoa'] = this.situacaoCadastralPessoa;
    data['rgInscricao'] = this.rgInscricao;
    data['id'] = this.id;
    data['cpfCnpj'] = this.cpfCnpj;
    data['email'] = this.email;
    if (this.foto != null) {
      data['foto'] = this.foto.toJson();
    }
    return data;
  }
}
