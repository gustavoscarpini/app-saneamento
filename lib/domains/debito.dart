import 'package:appcontribuinte/domains/util.dart';

class Debito {
  String situacao;
  double valorDesconto;
  bool bloqueiaImpressao;
  bool dividaAtivaAjuizada;
  bool inscrito;
  int qtdeOpcoesPagamento;
  bool emAberto;
  int exercicio;
  double valorTotalSemHonorarios;
  String permissaoEmissaoDAMEnumValue;
  String situacaoEnumValue;
  bool cancelado;
  double valorTotal;
  bool parcelamentoCancelado;
  String cadastroNotNull;
  int id;
  String emissao;
  double valorCorrecao;
  String parcelaNotNull;
  int idDivida;
  String prescricao;
  bool somaNoDemonstrativo;
  bool vencido;
  bool cotaUnica;
  int idParcela;
  double valorPago;
  double valorJuros;
  int vencimento;
  double valorTaxa;
  bool pago;
  int quantidadeParcelasDoValorDivida;
  String situacaoDescricaoEnum;
  int idPessoa;
  double valorHonorarios;
  double valorImposto;
  String cadastro;
  double valorOriginal;
  bool parcelaBloqueioJudicial;
  String pagamento;
  int idOpcaoPagamento;
  String tipoDeDebito;
  bool dividaIsDividaAtiva;
  String pagamentoToString;
  int idCadastro;
  String situacaoNameEnum;
  int idCalculo;
  int ordemApresentacao;
  String tipoCadastroCompleto;
  int idConfiguracaoAcrescimo;
  String parcela;
  int sd;
  double total;
  bool emitido;
  bool utilizaCache;
  String tipoCalculo;
  String divida;
  int diasAtraso;
  bool dividaAtiva;
  String tipoCalculoEnumValue;
  double valorMulta;
  double valorTotalSemDesconto;
  String tipoCadastroTributarioEnumValue;
  int idValorDivida;
  String permissaoEmissaoDAM;
  bool aguardando;
  bool podeSomarDemonstrativo;
  int quantidadeDamImpresso;
  int sequenciaParcela;
  String vencimentoToString;
  double valorOriginalComHonorarios;
  bool parcelado;
  String tipoCadastro;
  String referencia;
  bool selecionada;
  bool isentaAcrescimos;

  Debito(
      {this.situacao,
      this.valorDesconto,
      this.bloqueiaImpressao,
      this.dividaAtivaAjuizada,
      this.inscrito,
      this.qtdeOpcoesPagamento,
      this.emAberto,
      this.exercicio,
      this.valorTotalSemHonorarios,
      this.permissaoEmissaoDAMEnumValue,
      this.situacaoEnumValue,
      this.cancelado,
      this.valorTotal,
      this.parcelamentoCancelado,
      this.cadastroNotNull,
      this.id,
      this.emissao,
      this.valorCorrecao,
      this.parcelaNotNull,
      this.idDivida,
      this.prescricao,
      this.somaNoDemonstrativo,
      this.vencido,
      this.cotaUnica,
      this.idParcela,
      this.valorPago,
      this.valorJuros,
      this.vencimento,
      this.valorTaxa,
      this.pago,
      this.quantidadeParcelasDoValorDivida,
      this.situacaoDescricaoEnum,
      this.idPessoa,
      this.valorHonorarios,
      this.valorImposto,
      this.cadastro,
      this.valorOriginal,
      this.parcelaBloqueioJudicial,
      this.pagamento,
      this.idOpcaoPagamento,
      this.tipoDeDebito,
      this.dividaIsDividaAtiva,
      this.pagamentoToString,
      this.idCadastro,
      this.situacaoNameEnum,
      this.idCalculo,
      this.ordemApresentacao,
      this.tipoCadastroCompleto,
      this.idConfiguracaoAcrescimo,
      this.parcela,
      this.sd,
      this.total,
      this.emitido,
      this.utilizaCache,
      this.tipoCalculo,
      this.divida,
      this.diasAtraso,
      this.dividaAtiva,
      this.tipoCalculoEnumValue,
      this.valorMulta,
      this.valorTotalSemDesconto,
      this.tipoCadastroTributarioEnumValue,
      this.idValorDivida,
      this.permissaoEmissaoDAM,
      this.aguardando,
      this.podeSomarDemonstrativo,
      this.quantidadeDamImpresso,
      this.sequenciaParcela,
      this.vencimentoToString,
      this.valorOriginalComHonorarios,
      this.parcelado,
      this.tipoCadastro,
      this.referencia,
      this.selecionada,
      this.isentaAcrescimos});

  Debito.fromJson(Map<String, dynamic> json) {
    situacao = json['situacao'];
    valorDesconto = json['valorDesconto'];
    bloqueiaImpressao = json['bloqueiaImpressao'];
    dividaAtivaAjuizada = json['dividaAtivaAjuizada'];
    inscrito = json['inscrito'];
    qtdeOpcoesPagamento = json['qtdeOpcoesPagamento'];
    emAberto = json['emAberto'];
    exercicio = json['exercicio'];
    valorTotalSemHonorarios = json['valorTotalSemHonorarios'];
    permissaoEmissaoDAMEnumValue = json['permissaoEmissaoDAMEnumValue'];
    situacaoEnumValue = json['situacaoEnumValue'];
    cancelado = json['cancelado'];
    valorTotal = json['valorTotal'];
    parcelamentoCancelado = json['parcelamentoCancelado'];
    cadastroNotNull = json['cadastroNotNull'];
    id = json['id'];
    emissao = json['emissao'];
    valorCorrecao = json['valorCorrecao'];
    parcelaNotNull = json['parcelaNotNull'];
    idDivida = json['idDivida'];
    prescricao = json['prescricao'];
    somaNoDemonstrativo = json['somaNoDemonstrativo'];
    vencido = json['vencido'];
    cotaUnica = json['cotaUnica'];
    idParcela = json['idParcela'];
    valorPago = json['valorPago'] != null ? json['valorPago'].toDouble() : 0.0;
    valorJuros = json['valorJuros'] != null ? json['valorJuros'].toDouble() : 0.0;
    vencimento = json['vencimento'].runtimeType == String ? Util.serverSideFormart.parse(json['vencimento']).millisecondsSinceEpoch : json['vencimento'];
    valorTaxa = json['valorTaxa'] != null ? json['valorTaxa'].toDouble() : 0.0;
    pago = json['pago'];
    quantidadeParcelasDoValorDivida = json['quantidadeParcelasDoValorDivida'];
    situacaoDescricaoEnum = json['situacaoDescricaoEnum'];
    idPessoa = json['idPessoa'];
    valorHonorarios =  json['valorHonorarios'] != null ? json['valorHonorarios'].toDouble() : 0.0;
    valorImposto =  json['valorImposto'] != null ? json['valorImposto'].toDouble() : 0.0;
    cadastro = json['cadastro'];
    valorOriginal = json['valorOriginal'] != null ? json['valorOriginal'].toDouble() : 0.0;
    parcelaBloqueioJudicial = json['parcelaBloqueioJudicial'];
    pagamento = json['pagamento'];
    idOpcaoPagamento = json['idOpcaoPagamento'];
    tipoDeDebito = json['tipoDeDebito'];
    dividaIsDividaAtiva = json['dividaIsDividaAtiva'];
    pagamentoToString = json['pagamentoToString'];
    idCadastro = json['idCadastro'];
    situacaoNameEnum = json['situacaoNameEnum'];
    idCalculo = json['idCalculo'];
    ordemApresentacao = json['ordemApresentacao'];
    tipoCadastroCompleto = json['tipoCadastroCompleto'];
    idConfiguracaoAcrescimo = json['idConfiguracaoAcrescimo'];
    parcela = json['parcela'];
    sd = json['sd'];
    total = json['total'] != null ? json['total'].toDouble() : 0.0;
    emitido = json['emitido'];
    utilizaCache = json['utilizaCache'];
    tipoCalculo = json['tipoCalculo'];
    divida = json['divida'];
    diasAtraso = json['diasAtraso'];
    dividaAtiva = json['dividaAtiva'];
    tipoCalculoEnumValue = json['tipoCalculoEnumValue'];
    valorMulta =  json['valorMulta'] != null ? json['valorMulta'].toDouble() : 0.0;
    valorTotalSemDesconto = json['valorTotalSemDesconto'] != null ? json['valorTotalSemDesconto'].toDouble() : 0.0;
    tipoCadastroTributarioEnumValue = json['tipoCadastroTributarioEnumValue'];
    idValorDivida = json['idValorDivida'];
    permissaoEmissaoDAM = json['permissaoEmissaoDAM'];
    aguardando = json['aguardando'];
    podeSomarDemonstrativo = json['podeSomarDemonstrativo'];
    quantidadeDamImpresso = json['quantidadeDamImpresso'];
    sequenciaParcela = json['sequenciaParcela'];
    vencimentoToString = json['vencimentoToString'];
    valorOriginalComHonorarios = json['valorOriginalComHonorarios'];
    parcelado = json['parcelado'];
    tipoCadastro = json['tipoCadastro'];
    referencia = json['referencia'];
    selecionada = json['selecionada'];
    isentaAcrescimos = json['isentaAcrescimos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['situacao'] = this.situacao;
    data['valorDesconto'] = this.valorDesconto;
    data['bloqueiaImpressao'] = this.bloqueiaImpressao;
    data['dividaAtivaAjuizada'] = this.dividaAtivaAjuizada;
    data['inscrito'] = this.inscrito;
    data['qtdeOpcoesPagamento'] = this.qtdeOpcoesPagamento;
    data['emAberto'] = this.emAberto;
    data['exercicio'] = this.exercicio;
    data['valorTotalSemHonorarios'] = this.valorTotalSemHonorarios;
    data['permissaoEmissaoDAMEnumValue'] = this.permissaoEmissaoDAMEnumValue;
    data['situacaoEnumValue'] = this.situacaoEnumValue;
    data['cancelado'] = this.cancelado;
    data['valorTotal'] = this.valorTotal;
    data['parcelamentoCancelado'] = this.parcelamentoCancelado;
    data['cadastroNotNull'] = this.cadastroNotNull;
    data['id'] = this.id;
    data['emissao'] = this.emissao;
    data['valorCorrecao'] = this.valorCorrecao;
    data['parcelaNotNull'] = this.parcelaNotNull;
    data['idDivida'] = this.idDivida;
    data['prescricao'] = this.prescricao;
    data['somaNoDemonstrativo'] = this.somaNoDemonstrativo;
    data['vencido'] = this.vencido;
    data['cotaUnica'] = this.cotaUnica;
    data['idParcela'] = this.idParcela;
    data['valorPago'] = this.valorPago;
    data['valorJuros'] = this.valorJuros;
    data['vencimento'] = this.vencimento;
    data['valorTaxa'] = this.valorTaxa;
    data['pago'] = this.pago;
    data['quantidadeParcelasDoValorDivida'] =
        this.quantidadeParcelasDoValorDivida;
    data['situacaoDescricaoEnum'] = this.situacaoDescricaoEnum;
    data['idPessoa'] = this.idPessoa;
    data['valorHonorarios'] = this.valorHonorarios;
    data['valorImposto'] = this.valorImposto;
    data['cadastro'] = this.cadastro;
    data['valorOriginal'] = this.valorOriginal;
    data['parcelaBloqueioJudicial'] = this.parcelaBloqueioJudicial;
    data['pagamento'] = this.pagamento;
    data['idOpcaoPagamento'] = this.idOpcaoPagamento;
    data['tipoDeDebito'] = this.tipoDeDebito;
    data['dividaIsDividaAtiva'] = this.dividaIsDividaAtiva;
    data['pagamentoToString'] = this.pagamentoToString;
    data['idCadastro'] = this.idCadastro;
    data['situacaoNameEnum'] = this.situacaoNameEnum;
    data['idCalculo'] = this.idCalculo;
    data['ordemApresentacao'] = this.ordemApresentacao;
    data['tipoCadastroCompleto'] = this.tipoCadastroCompleto;
    data['idConfiguracaoAcrescimo'] = this.idConfiguracaoAcrescimo;
    data['parcela'] = this.parcela;
    data['sd'] = this.sd;
    data['total'] = this.total;
    data['emitido'] = this.emitido;
    data['utilizaCache'] = this.utilizaCache;
    data['tipoCalculo'] = this.tipoCalculo;
    data['divida'] = this.divida;
    data['diasAtraso'] = this.diasAtraso;
    data['dividaAtiva'] = this.dividaAtiva;
    data['tipoCalculoEnumValue'] = this.tipoCalculoEnumValue;
    data['valorMulta'] = this.valorMulta;
    data['valorTotalSemDesconto'] = this.valorTotalSemDesconto;
    data['tipoCadastroTributarioEnumValue'] =
        this.tipoCadastroTributarioEnumValue;
    data['idValorDivida'] = this.idValorDivida;
    data['permissaoEmissaoDAM'] = this.permissaoEmissaoDAM;
    data['aguardando'] = this.aguardando;
    data['podeSomarDemonstrativo'] = this.podeSomarDemonstrativo;
    data['quantidadeDamImpresso'] = this.quantidadeDamImpresso;
    data['sequenciaParcela'] = this.sequenciaParcela;
    data['vencimentoToString'] = this.vencimentoToString;
    data['valorOriginalComHonorarios'] = this.valorOriginalComHonorarios;
    data['parcelado'] = this.parcelado;
    data['tipoCadastro'] = this.tipoCadastro;
    data['referencia'] = this.referencia;
    data['selecionada'] = this.selecionada;
    data['isentaAcrescimos'] = this.isentaAcrescimos;
    return data;
  }
}
