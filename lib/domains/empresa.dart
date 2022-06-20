import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/socio.dart';

class Empresa {
  String? tipoPessoa;
  String? pessoa;
  String? tipoAutonomo;
  String? tipoIssqn;
  List<Socio>? socios;
  List<Alvara>? alvaras;
  String? nomeFantasia;
  String? abertura;
  String? naturezaJuridica;
  String? cmc;
  String? classificacaoAtividade;
  int? id;
  String? cpfCnpj;
  bool? autonomo;

  Empresa(
      {this.tipoPessoa,
      this.pessoa,
      this.tipoAutonomo,
      this.tipoIssqn,
      this.socios,
      this.nomeFantasia,
      this.abertura,
      this.naturezaJuridica,
      this.cmc,
        this.classificacaoAtividade,
      this.id,
      this.cpfCnpj,
      this.autonomo}){
     this.alvaras = [];
  }

  Empresa.fromJson(Map<String, dynamic> json) {
    tipoPessoa = json['tipoPessoa'];
    pessoa = json['pessoa'];
    tipoAutonomo = json['tipoAutonomo'];
    tipoIssqn = json['tipoIssqn'];
    if (json['socios'] != null) {
      socios = [];
      json['socios'].forEach((v) {
        socios!.add(new Socio.fromJson(v));
      });
    }
    nomeFantasia = json['nomeFantasia'];
    abertura = json['abertura'];
    naturezaJuridica = json['naturezaJuridica'];
    cmc = json['cmc'];
    classificacaoAtividade = json['classificacaoAtividade'];
    id = json['id'];
    cpfCnpj = json['cpfCnpj'];
    autonomo = json['autonomo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipoPessoa'] = this.tipoPessoa;
    data['pessoa'] = this.pessoa;
    data['tipoAutonomo'] = this.tipoAutonomo;
    data['tipoIssqn'] = this.tipoIssqn;
    if (this.socios != null) {
      data['socios'] = this.socios!.map((v) => v.toJson()).toList();
    }
    data['nomeFantasia'] = this.nomeFantasia;
    data['abertura'] = this.abertura;
    data['naturezaJuridica'] = this.naturezaJuridica;
    data['cmc'] = this.cmc;
    data['classificacaoAtividade'] = this.classificacaoAtividade;
    data['id'] = this.id;
    data['cpfCnpj'] = this.cpfCnpj;
    data['autonomo'] = this.autonomo;
    return data;
  }
}
