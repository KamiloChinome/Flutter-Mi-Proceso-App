import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/values/colors.dart';

class AuthPage extends StatelessWidget {
  final List<Widget> children;
  final Widget child;
  const AuthPage({
    super.key, 
    required this.children, required this.child, 
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Marca1Box(child: child,),
        _FormBox(children: children,),
        // _Marca1Box(child: child,),
      ],
    );
  }
}

class _FormBox extends StatelessWidget {
  final List<Widget> children;
  const _FormBox({
    Key? key, 
    required this.children, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: children,
      ),
    );
  }
}

class _Marca1Box extends StatelessWidget {
  final Widget child;
  const _Marca1Box({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: marca1,
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Center(
              child: child,
          ),
          const Positioned(top: 20,left: 40,child: _Bubble(),),
          const Positioned(top: 250,left: 0,child: _Bubble(),),
          const Positioned(top: 80,left: 330,child: _Bubble(),),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}