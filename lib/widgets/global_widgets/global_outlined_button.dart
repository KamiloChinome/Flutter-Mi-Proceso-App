import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';

class GlobalOutlinedButton extends StatelessWidget {
  final String text;
  final double heigtPercentage;
  final double widthPercentage;
  final double fontSize;
  final Function()? onPressed;
  
  const GlobalOutlinedButton({
    super.key, 
    required this.text, 
    required this.onPressed, 
    this.heigtPercentage = 0.05, 
    this.widthPercentage = 0.05, 
    this.fontSize = 18
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
      elevation: 10,
        minimumSize: Size(size.width * widthPercentage, size.height * heigtPercentage),
        backgroundColor: verde2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: fontSize, color: negro, fontFamily: poppinsR),),
    );
  }
}