import 'package:flutter/material.dart';

class GlobalIconButton extends StatelessWidget {
  const GlobalIconButton({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onPressed
    });

  final IconData icon;
  final double iconSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: iconSize,),
      onPressed: onPressed,
    );
  }
}