class Evento {
  String? descricao;
  String? identificacao;
  String? valor;

  Evento({this.descricao, this.identificacao, this.valor});

  Evento.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    identificacao = json['identificacao'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['identificacao'] = this.identificacao;
    data['valor'] = this.valor;
    return data;
  }
}
