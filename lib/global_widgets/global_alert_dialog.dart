import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
class GlobalAlertDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  const GlobalAlertDialog({Key? key,required this.title, required this.children, this.actions,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16)),
      elevation: 5,
      title: Text(title, textAlign: TextAlign.center,),
      titleTextStyle: const TextStyle(fontFamily: poppinsB, fontSize: 18, color: marca1,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      actions: actions,
    );
  }
}