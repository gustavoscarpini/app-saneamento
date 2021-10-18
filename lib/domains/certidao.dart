class Certidao {
  int id;
  int codigo;
  String tipoDocumento;
  String tipoCadastro;
  String cadastro;
  String situacao;
  bool vencida;
  String dataSolicitacao;
  String validade;

  Certidao(
      {this.id,
      this.codigo,
      this.tipoDocumento,
      this.tipoCadastro,
      this.cadastro,
      this.situacao,
      this.vencida,
      this.dataSolicitacao,
      this.validade});

  Certidao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    tipoDocumento = json['tipoDocumento'];
    tipoCadastro = json['tipoCadastro'];
    cadastro = json['cadastro'];
    situacao = json['situacao'];
    vencida = json['vencida'];
    dataSolicitacao = json['dataSolicitacao'];
    validade = json['validade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['tipoDocumento'] = this.tipoDocumento;
    data['tipoCadastro'] = this.tipoCadastro;
    data['cadastro'] = this.cadastro;
    data['situacao'] = this.situacao;
    data['vencida'] = this.vencida;
    data['dataSolicitacao'] = this.dataSolicitacao;
    data['validade'] = this.validade;
    return data;
  }
}
