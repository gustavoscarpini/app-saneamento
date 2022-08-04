import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  final String? label;
  final TextInputFormatter? formatter;
  final TextEditingController? controller;
  final Function? onSubmitted;
  final Function? onTap;
  final TextInputType type;

  const InputText({
    Key? key,
    this.label,
    this.formatter,
    this.controller,
    this.onSubmitted,
    this.onTap,
    this.type = TextInputType.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: formatter != null ? [formatter!]: null,
      keyboardType: type,
      controller: controller,
      onSubmitted: onSubmitted as void Function(String)?,
      onTap: onTap as void Function()?,
      decoration: InputDecoration(
          helperText: controller!.text.isEmpty
              ? 'Informe o campo $label'
              : null,
          labelText: "$label",
          labelStyle: GoogleFonts.raleway(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 16)),
    );
  }
}
