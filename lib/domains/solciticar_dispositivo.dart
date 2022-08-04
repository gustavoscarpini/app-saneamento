class SolicitacaoDispositivo {
  bool? valido;
  String? cpf;
  String? dispositivo;
  String? codigo;

  SolicitacaoDispositivo(
      {this.valido,
        this.dispositivo,
        this.codigo,
        this.cpf});

  SolicitacaoDispositivo.fromJson(Map<String, dynamic> json) {
    cpf = json['cpf'];
    dispositivo = json['dispositivo'];
    codigo = json['codigo'];
    valido = json['valido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpf'] = this.cpf;
    data['dispositivo'] = this.dispositivo;
    data['codigo'] = this.codigo;
    data['ativo'] = this.valido;
    return data;
  }
}
