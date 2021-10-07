class Protocolo {
  String obs;
  String situacao;
  int ano;
  int numero;
  List<Tramites> tramites;
  String assunto;
  bool protocolo;
  String cadastradoPor;
  List<Documentos> documentos;
  String resumo;
  String responsavel;
  String dataHora;
  String requerente;

  Protocolo(
      {this.obs,
        this.situacao,
        this.ano,
        this.numero,
        this.tramites,
        this.assunto,
        this.protocolo,
        this.cadastradoPor,
        this.documentos,
        this.resumo,
        this.responsavel,
        this.dataHora,
        this.requerente});

  Protocolo.fromJson(Map<String, dynamic> json) {
    obs = json['obs'];
    situacao = json['situacao'];
    ano = json['ano'];
    numero = json['numero'];
    if (json['tramites'] != null) {
      tramites = new List<Tramites>();
      json['tramites'].forEach((v) {
        tramites.add(new Tramites.fromJson(v));
      });
    }
    assunto = json['assunto'];
    protocolo = json['protocolo'];
    cadastradoPor = json['cadastradoPor'];
    if (json['documentos'] != null) {
      documentos = new List<Documentos>();
      json['documentos'].forEach((v) {
        documentos.add(new Documentos.fromJson(v));
      });
    }
    resumo = json['resumo'];
    responsavel = json['responsavel'];
    dataHora = json['dataHora'];
    requerente = json['requerente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['obs'] = this.obs;
    data['situacao'] = this.situacao;
    data['ano'] = this.ano;
    data['numero'] = this.numero;
    if (this.tramites != null) {
      data['tramites'] = this.tramites.map((v) => v.toJson()).toList();
    }
    data['assunto'] = this.assunto;
    data['protocolo'] = this.protocolo;
    data['cadastradoPor'] = this.cadastradoPor;
    if (this.documentos != null) {
      data['documentos'] = this.documentos.map((v) => v.toJson()).toList();
    }
    data['resumo'] = this.resumo;
    data['responsavel'] = this.responsavel;
    data['dataHora'] = this.dataHora;
    data['requerente'] = this.requerente;
    return data;
  }
}

class Tramites {
  String situacao;
  String observacao;
  String motivo;
  int indice;
  String origem;
  DateTime conclusao;
  String destino;
  DateTime aceite;

  Tramites(
      {this.situacao,
        this.observacao,
        this.motivo,
        this.indice,
        this.origem,
        this.conclusao,
        this.destino,
        this.aceite});

  Tramites.fromJson(Map<String, dynamic> json) {
    situacao = json['situacao'];
    observacao = json['observacao'];
    motivo = json['motivo'];
    indice = json['indice'];
    origem = json['origem'];
    conclusao = json['conclusao'];
    destino = json['destino'];
    aceite = json['aceite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['situacao'] = this.situacao;
    data['observacao'] = this.observacao;
    data['motivo'] = this.motivo;
    data['indice'] = this.indice;
    data['origem'] = this.origem;
    data['conclusao'] = this.conclusao;
    data['destino'] = this.destino;
    data['aceite'] = this.aceite;
    return data;
  }
}

class Documentos {
  String numero;
  String nome;

  Documentos({this.numero, this.nome});

  Documentos.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['nome'] = this.nome;
    return data;
  }
}
