import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/services.dart';

class CpfCnpjFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cpfCnpjValido = "";
    if (CPFValidator.isValid(newValue.text)) {
      cpfCnpjValido = CPFValidator.format(newValue.text);
    }
    if (CNPJValidator.isValid(newValue.text)) {
      cpfCnpjValido = CNPJValidator.format(newValue.text);
    }
    if (cpfCnpjValido.isNotEmpty) {
      return newValue.copyWith(
          text: cpfCnpjValido,
          selection: new TextSelection.collapsed(offset: cpfCnpjValido.length));
    }
    return newValue;
  }
}
