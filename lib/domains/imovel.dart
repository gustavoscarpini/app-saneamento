import 'package:appcontribuinte/domains/construcao.dart';
import 'package:appcontribuinte/domains/evento.dart';

class Imovel {
  int? id;
  String? inscricao;
  String? setor;
  String? quadra;
  String? lote;
  String? lograouro;
  String? bairro;
  double? areaConstruida;
  double? areaTerreno;
  List<Evento>? eventos;
  List<String>? proprietarios;
  List<Construcao>? construcoes;
  String? numero;
  String? complemento;
  String? testada;
  String? trechoLogradouro;

  Imovel(
      {this.id,
        this.inscricao,
        this.setor,
        this.quadra,
        this.lote,
        this.lograouro,
        this.bairro,
        this.areaConstruida,
        this.areaTerreno,
        this.eventos,
        this.proprietarios,
        this.construcoes,
        this.numero,
        this.complemento,
        this.testada,
        this.trechoLogradouro});

  Imovel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inscricao = json['inscricao'];
    setor = json['setor'];
    quadra = json['quadra'];
    lote = json['lote'];
    lograouro = json['lograouro'];
    bairro = json['bairro'];
    areaConstruida = json['areaConstruida'] != null ? json['areaConstruida'].toDouble() : 0.0;
    areaTerreno = json['areaTerreno'] != null ? json['areaTerreno'].toDouble() : 0.0;
    if (json['eventos'] != null) {
      eventos = [];
      json['eventos'].forEach((v) {
        eventos!.add(new Evento.fromJson(v));
      });
    }
    proprietarios = json['proprietarios'].cast<String>();

    if (json['construcoes'] != null) {
      construcoes = [];
      json['construcoes'].forEach((v) {
        construcoes!.add(new Construcao.fromJson(v));
      });
    }
    numero = json['numero'];
    complemento = json['complemento'];
    testada = json['testada'];
    trechoLogradouro = json['trechoLogradouro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inscricao'] = this.inscricao;
    data['setor'] = this.setor;
    data['quadra'] = this.quadra;
    data['lote'] = this.lote;
    data['lograouro'] = this.lograouro;
    data['bairro'] = this.bairro;
    data['areaConstruida'] = this.areaConstruida;
    data['areaTerreno'] = this.areaTerreno;
    if (this.eventos != null) {
      data['eventos'] = this.eventos!.map((v) => v.toJson()).toList();
    }
    data['proprietarios'] = this.proprietarios;
    if (this.construcoes != null) {
      data['construcoes'] = this.construcoes!.map((v) => v.toJson()).toList();
    }
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['testada'] = this.testada;
    data['trechoLogradouro'] = this.trechoLogradouro;
    return data;
  }
}



