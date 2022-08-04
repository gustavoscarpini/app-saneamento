import 'dart:convert';

class Pix {
  String? qrCode;
  String? base64Pix;
  String? vencimento;

  Pix({this.qrCode, this.base64Pix, this.vencimento});

  Pix.fromJson(String data) {
    var response = jsonDecode(data);
    qrCode = response['qrCode'];
    base64Pix = response['base64Pix'];
    vencimento = response['vencimento'];
  }
}
