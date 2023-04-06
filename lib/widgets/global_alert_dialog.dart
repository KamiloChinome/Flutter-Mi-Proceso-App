import 'package:flutter/material.dart';
class GlobalAlertDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  const GlobalAlertDialog({Key? key,required this.title, required this.children, this.actions,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16)),
      elevation: 5,
      title: Text(title, textAlign: TextAlign.center,),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      actions: actions,
    );
  }
}