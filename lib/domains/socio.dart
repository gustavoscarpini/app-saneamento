class Socio {
  double proporcao;
  String socio;

  Socio({this.proporcao, this.socio});

  Socio.fromJson(Map<String, dynamic> json) {
    proporcao = json['proporcao'];
    socio = json['socio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proporcao'] = this.proporcao;
    data['socio'] = this.socio;
    return data;
  }
}
