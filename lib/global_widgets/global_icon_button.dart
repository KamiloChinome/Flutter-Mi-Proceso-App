import 'package:flutter/material.dart';

class GlobalIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final Function()? onPressed;
  final Color? color;

  const GlobalIconButton({
    super.key,
    required this.icon,
    this.color,
    this.iconSize,
    required this.onPressed
    });



  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, 
      color: color,
      size: iconSize,
      ),
      onPressed: onPressed,
    );
  }
}