import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/global_widgets/global_outlined_button.dart';
import 'package:miprocesoapp/values/colors.dart';
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
                  const Text('Codigo de verificacion', style: TextStyle(color: marca1, fontSize: 25),),
                  SizedBox(height: size.height * 0.02,),
                  const Text(
                    'Ingresa el codigo de 4 digitos que hemos enviado a tu email', 
                    style: TextStyle(
                      color: marca1, 
                      fontSize: 16
                    ), 
                    textAlign: TextAlign.center
                  ),
                  SizedBox(height: size.height * 0.035,),
                  const _FormVerificationCode(),
                  SizedBox(height: size.height * 0.006,),
                  const Text('el codigo vence en: 00:00', style: TextStyle(color: negro, fontSize: 14),),
                  SizedBox(height: size.height * 0.18,),
                  GlobalOutlinedButton(
                    widthPercentage: 0.9,
                    heigtPercentage: 0.065,
                    text: 'Verificar codigo', onPressed: (){},
                    fontSize: 20,
                  ),
                  SizedBox(height: size.height * 0.02,),
                  GestureDetector(
                    onTap: (() {
                      //TODO: REENVIAR CODIGO
                    }),
                    child: const Text('¿No has recibido el codigo?', style: TextStyle(color: azulrey))
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

class _FormVerificationCode extends StatelessWidget {
  const _FormVerificationCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _VerificationTextField(first: true, last: false,),
        _VerificationTextField(first: false, last: false,),
        _VerificationTextField(first: false, last: false,),
        _VerificationTextField(first: false, last: true,),
        
      ],
    );
  }
}

class _VerificationTextField extends StatelessWidget {

  final bool first;
  final bool last;

  const _VerificationTextField({required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 65,
      child: TextField(
        onChanged: (value) {
          if(value.length == 1 && last == false){
            FocusScope.of(context).nextFocus();
          }
          if(value.isEmpty && first == false){
            FocusScope.of(context).previousFocus();
          }
          if(value.length == 1 && last == true){
            FocusScope.of(context).unfocus();
          }
        },
        keyboardType: TextInputType.number,
        style: const TextStyle(color: negro, fontSize: 25),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: azulrey),
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
