import 'package:appcontribuinte/domains/evento.dart';

class Construcao {
  String descricao;
  double area;
  String qualidadeConstrucao;
  List<Evento> eventos;

  Construcao(
      {this.descricao, this.area, this.qualidadeConstrucao, this.eventos});

  Construcao.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    area = json['area'];
    qualidadeConstrucao = json['qualidadeConstrucao'];
    if (json['eventos'] != null) {
      eventos = new List<Evento>();
      json['eventos'].forEach((v) {
        eventos.add(new Evento.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['area'] = this.area;
    data['qualidadeConstrucao'] = this.qualidadeConstrucao;
    if (this.eventos != null) {
      data['eventos'] = this.eventos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
