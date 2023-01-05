import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';

class GlobalOutlinedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const GlobalOutlinedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
      elevation: 1,
        minimumSize: Size(120, sizeHeight * 0.05),
        backgroundColor: verde2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: marca1, fontSize: 18),),
    );
  }
}