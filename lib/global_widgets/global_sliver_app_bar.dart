import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/global_widgets/global_icon_button.dart';

class GlobalSliverAppbar extends StatelessWidget {
  final String screeninfo;
  final String titleText;
  final IconData iconLeading;
  final Function()? leadingOnPressed;
  final List<Widget>? actions;

  const GlobalSliverAppbar({
    super.key, 
    required this.screeninfo, 
    required this.titleText, 
    required this.iconLeading, 
    this.leadingOnPressed, 
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: sizeHeight*0.1,
      floating: true,
      title: _Title(titleText: titleText, screeninfo: screeninfo),
      leading: GlobalIconButton(
        icon: iconLeading, 
        iconSize: 30, 
        onPressed: leadingOnPressed,
      ),
      actions: actions,
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.titleText,
    required this.screeninfo,
  }) : super(key: key);

  final String titleText;
  final String screeninfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        Column(
          children: [
            const SizedBox(height: 5,),
            Text(titleText, style: Theme.of(context).appBarTheme.titleTextStyle),
            Text(screeninfo, style: Theme.of(context).appBarTheme.titleTextStyle),
          ],
        )
      ],
    );
  }
}