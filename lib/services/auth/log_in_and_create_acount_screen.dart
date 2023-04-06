import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/services/auth/login_and_sign_up_provider.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/services/auth/auth_widgets/auth_page_widget.dart';
import 'package:provider/provider.dart';

import 'auth_widgets/card_container_widget.dart';
import 'auth_widgets/login_form_widget.dart';
import 'auth_widgets/signup_form_widget.dart';

class LogInAndSignUpScreen extends StatelessWidget {
  const LogInAndSignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInAndSignUpProvider(),
      child: const Scaffold(
        backgroundColor: blanco,
        body: AuthPage(
          child: Image(image: AssetImage('assets/logos/logo1.png'), fit: BoxFit.contain, height: 200,),
          children: [
            _Children()
          ]
        ),
      ),
    );
  }
}


class _Children extends StatelessWidget {
  const _Children();

  @override
  Widget build(BuildContext context) {
    final authFormService = Provider.of<LogInAndSignUpProvider>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.3,),
            const _LoginForm(),
            SizedBox(height: size.height * 0.02,),
            TextButton(
              onPressed: () {
                authFormService.visible = !authFormService.visible;
                authFormService.errorForm = false;}, 
              child: Text(
                (authFormService.visible == false) ? '$existingAccount \n $logInText' : createAnAcount,
                style: const TextStyle(
                  fontFamily: poppinsR,
                  fontSize: 18, 
                  color: azulrey
                ),
              textAlign: TextAlign.center,
              )
            ),
          SizedBox(height: size.height * ((authFormService.visible == false) ? 0.001: 0.15)),
        ],
      ),
    );
  }
}
class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logInAndSignUpProvider = Provider.of<LogInAndSignUpProvider>(context);
    
    return Column(
      children: [
        Visibility(
          visible: (logInAndSignUpProvider.visible == true) ? true : false,
          child: FadeInUp(
            from: 20,
            child: const CardContainerWidget(
              child: LoginFormWidget()
            ),
          ),
        ),
        Visibility(
          visible: (logInAndSignUpProvider.visible == true) ? false : true,
          child: FadeInUp(
            from: 20,
            child: const CardContainerWidget(
              child: SignUpFormWidget()
            ),
          ),
        )
      ],
    );
  }
}




