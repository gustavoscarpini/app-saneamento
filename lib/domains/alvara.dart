class Alvara {
  bool podeEmitirAlvara;
  String tipo;
  int ano;
  String situacaoParcela;
  String cmc;
  String inicio;
  String assinaturaDigital;
  String fim;
  int id;
  String emissao;
  String vencimento;
  bool provisorio;

  Alvara(
      {this.podeEmitirAlvara,
        this.tipo,
        this.ano,
        this.situacaoParcela,
        this.cmc,
        this.inicio,
        this.assinaturaDigital,
        this.fim,
        this.id,
        this.emissao,
        this.vencimento,
        this.provisorio});

  Alvara.fromJson(Map<String, dynamic> json) {
    podeEmitirAlvara = json['podeEmitirAlvara'];
    tipo = json['tipo'];
    ano = json['ano'];
    situacaoParcela = json['situacaoParcela'];
    cmc = json['cmc'];
    inicio = json['inicio'];
    assinaturaDigital = json['assinaturaDigital'];
    fim = json['fim'];
    id = json['id'];
    emissao = json['emissao'];
    vencimento = json['vencimento'];
    provisorio = json['provisorio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['podeEmitirAlvara'] = this.podeEmitirAlvara;
    data['tipo'] = this.tipo;
    data['ano'] = this.ano;
    data['situacaoParcela'] = this.situacaoParcela;
    data['cmc'] = this.cmc;
    data['inicio'] = this.inicio;
    data['assinaturaDigital'] = this.assinaturaDigital;
    data['fim'] = this.fim;
    data['id'] = this.id;
    data['emissao'] = this.emissao;
    data['vencimento'] = this.vencimento;
    data['provisorio'] = this.provisorio;
    return data;
  }
}
