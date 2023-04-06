import 'package:flutter/material.dart';
import 'package:miprocesoapp/features/processes/processes_provider.dart';
import 'package:provider/provider.dart';
class BottomNavigationBarButton extends StatelessWidget {

  final VoidCallback onPressed;
  final int currentIndex;
  final String text;

  final IconData icon;
  final Color color;
  const BottomNavigationBarButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.currentIndex,
    required this.text,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: (currentIndex != Provider.of<ChangeListProvider>(context).selectedButton ) ? Colors.grey : color,
            size: (currentIndex != Provider.of<ChangeListProvider>(context).selectedButton ) ? 26 : 29,
          ),
          Text(
            text, 
            style: TextStyle(
              fontSize: 14, 
              color: (currentIndex != Provider.of<ChangeListProvider>(context).selectedButton ) ? Colors.grey : Theme.of(context).textTheme.titleLarge?.color,
            ),
          ) 
        ],
      ),
    );
  }
}

