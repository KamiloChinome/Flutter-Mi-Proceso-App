import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/info.dart';
import 'package:miprocesoapp/values/texts.dart';

class AlarmScreen extends StatelessWidget {
  
  const AlarmScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(sizeHeight*0.08),
        child: const _AppBar()),
        // body: _AlarmFormat(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: alarms,
        ),
    );
  }
}


class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: marca1,
      actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings, size: 30,))
    ],
      title: const Text(alarm),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios_new_outlined, size: 30,)),
    );
  }
}