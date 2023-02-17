import 'package:flutter/material.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_outlined_button.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/widgets/auth_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailVerificationScreen extends StatelessWidget {
  
  const EmailVerificationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      body: AuthPage(
        child: SvgPicture.asset('assets/svgs/verificationemail.svg', height: 170,),
        children: const [
        _Children(),
      ]
      )
    );
  }
}

class _Children extends StatelessWidget {
  const _Children();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.24,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.04),
          margin: EdgeInsets.only(top: size.height * 0.13),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: blanco,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  const Text('Verifica tu correo electronico', style: TextStyle(color: marca1, fontSize: 24),),
                  SizedBox(height: size.height * 0.02,),
                  const Text(
                    'Ingresa a tu correo electronico y verificalo mediante el link que te enviamos', 
                    style: TextStyle(
                      color: marca1, 
                      fontSize: 16
                    ), 
                    textAlign: TextAlign.center
                  ),
                  SizedBox(height: size.height * 0.06,),
                  SvgPicture.asset('assets/svgs/verificationemail2.svg', height: 130,),
                  SizedBox(height: size.height * 0.06,),
                  GlobalOutlinedButton(
                    widthPercentage: 0.9,
                    heigtPercentage: 0.065,
                    text: 'Listo!', onPressed: (){
                      Navigator.pushReplacementNamed(context, 'HomeScreen');
                    },
                    fontSize: 20,
                  ),
                  SizedBox(height: size.height * 0.02,),
                  GestureDetector(
                    onTap: (() {
                      //TODO: REENVIAR CODIGO
                    }),
                    child: const Text('¿No has recibido el mensaje?', style: TextStyle(color: azulrey))
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

