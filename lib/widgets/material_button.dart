import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/button_model.dart';
import 'package:provider/provider.dart';
class Button extends StatelessWidget {

  final VoidCallback onPressed;
  final int currentIndex;
  final String text;

  final IconData icon;
  final Color color;
  const Button({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.currentIndex,
    required this.text,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 30,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: (currentIndex != Provider.of<ButtonModel>(context).selectedButton ) ? Colors.grey : color,
            size: (currentIndex != Provider.of<ButtonModel>(context).selectedButton ) ? 29 : 30,
          ),
          (currentIndex != Provider.of<ButtonModel>(context).selectedButton ) ? const SizedBox() : Text(text) 
        ],
      ),
    );
  }
}

