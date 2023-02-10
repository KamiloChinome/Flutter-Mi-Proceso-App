import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double size;

  const GlobalTextFormField({
    super.key, 
    required this.hintText, 
    required this.labelText, 
    required this.prefixIcon, 
    this.maxLines, 
    this.keyboardType, 
    this.obscureText = false, 
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelSmall,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autocorrect: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon, size: size,),
      ),
    );
  }
}