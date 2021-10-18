import 'dart:ffi';

import 'package:appcontribuinte/domains/imovel.dart';

class Itbi {
  int ano;
  int numero;
  Imovel imovel;
  double valor;
  List<Envolvido> adquirentes;
  int id;
  List<Envolvido> transmitentes;
  double baseCalculo;

  Itbi(
      {this.ano,
      this.imovel,
      this.numero,
      this.valor,
      this.adquirentes,
      this.id,
      this.transmitentes,
      this.baseCalculo});

  Itbi.fromJson(Map<String, dynamic> json) {
    ano = json['ano'];
    imovel =
        json['imovel'] != null ? new Imovel.fromJson(json['imovel']) : null;
    numero = json['numero'];
    valor =  json['valor'] != null ? json['valor'].toDouble() : 0.0;;
    if (json['adquirentes'] != null) {
      adquirentes = new List<Envolvido>();
      json['adquirentes'].forEach((v) {
        adquirentes.add(new Envolvido.fromJson(v));
      });
    }
    id = json['id'];
    if (json['transmitentes'] != null) {
      transmitentes = new List<Envolvido>();
      json['transmitentes'].forEach((v) {
        transmitentes.add(new Envolvido.fromJson(v));
      });
    }
    baseCalculo =  json['baseCalculo'] != null ? json['baseCalculo'].toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ano'] = this.ano;
    if (this.imovel != null) {
      data['imovel'] = this.imovel.toJson();
    }
    data['numero'] = this.numero;
    data['valor'] = this.valor;
    if (this.adquirentes != null) {
      data['adquirentes'] = this.adquirentes.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.transmitentes != null) {
      data['transmitentes'] =
          this.transmitentes.map((v) => v.toJson()).toList();
    }
    data['baseCalculo'] = this.baseCalculo;
    return data;
  }
}

class Envolvido {
  Double proporcaoSocio;
  String nome;
  String cpfCnpj;
  String email;

  Envolvido({this.proporcaoSocio, this.nome, this.cpfCnpj, this.email});

  Envolvido.fromJson(Map<String, dynamic> json) {
    proporcaoSocio = json['proporcaoSocio'];
    nome = json['nome'];
    cpfCnpj = json['cpfCnpj'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proporcaoSocio'] = this.proporcaoSocio;
    data['nome'] = this.nome;
    data['cpfCnpj'] = this.cpfCnpj;
    data['email'] = this.email;
    return data;
  }

  @override
  String toString() {
    return 'Envolvido{nome: $nome, cpfCnpj: $cpfCnpj}';
  }
}
