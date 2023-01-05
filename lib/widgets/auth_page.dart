import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';

class AuthPage extends StatelessWidget {
  final Widget logInForm;
  final String buttonText;
  final Function()? onPressed;
  final double percentage;
  const AuthPage({
    super.key, 
    required this.logInForm, 
    required this.buttonText, 
    required this.onPressed, 
    this.percentage = 0.25
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _Marca1Box(),
        _FormBox(
          text: buttonText,
          onPressed: onPressed,
          percentage: percentage,
          logInForm: logInForm,
        ),
      ],
    );
  }
}

class _FormBox extends StatelessWidget {
  final Widget logInForm;
  final String text;
  final Function()? onPressed;
  final double percentage;
  const _FormBox({Key? key, required this.logInForm, required this.text, required this.onPressed, required this.percentage,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.3,),
          logInForm,
          SizedBox(height: size.height * 0.02,),
          TextButton(
            onPressed: onPressed, 
            child: Text(text, 
            style: const TextStyle(
              fontSize: 18, 
              color: azulrey
            ),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: size.height * percentage,),
        ],
      ),
    );
  }
}

class _Marca1Box extends StatelessWidget {
  const _Marca1Box({
    Key? key,
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
            child: SizedBox(
              width: size.width * 0.7,
              height: size.height * 0.3,
              child: const Image(
                image: AssetImage('assets/logos/logo1.png'), 
                fit: BoxFit.contain,
              ),
            ),
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