import 'package:flutter/material.dart';

import '../../utils/values/colors.dart';

class CardContainerWidget extends StatelessWidget {
  final Widget child;
  const CardContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.03),
    width: double.infinity,
    decoration: BoxDecoration(
    color: blanco,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  ),
    child: child,
    );
  }
}