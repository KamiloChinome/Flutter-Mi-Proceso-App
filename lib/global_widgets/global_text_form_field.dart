import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';

class GlobalTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool obscureText;

  const GlobalTextFormField({
    super.key, 
    required this.hintText, 
    required this.labelText, 
    required this.prefixIcon, 
    this.maxLines, 
    this.keyboardType, 
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      autocorrect: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: marca1
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: azulrey,
            width: 2.4
          )
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: poppinsL),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon, color: marca1, size: 30,),
      ),
    );
  }
}