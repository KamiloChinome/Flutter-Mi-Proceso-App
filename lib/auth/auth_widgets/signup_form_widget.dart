import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/connection_status/check_internet_conection_util.dart';
import '../../utils/connection_status/conection_status_provider.dart';
import '../../utils/connection_status/warning_widget.dart';
import '../../utils/values/colors.dart';
import '../../utils/values/texts.dart';
import '../email_verification_screen.dart';
import '../firebase_auth_service.dart';
import '../login_and_sign_up_provider.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signUpForm = Provider.of<LogInAndSignUpProvider>(context);
    final connectionStatus = Provider.of<ConnectionStatusProvider>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: signUpForm.sigInUp,
      child: Column(
        children: [
          const Text(createAnAcount, style: TextStyle(fontSize: 25, color: negro, fontFamily: poppinsR),),
          const WarningTextWidget(),
          Visibility(
            visible: signUpForm.errorForm,
            child: const Text('Correo ya registrado', style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: poppinsL),)),
          TextFormField(
            cursorColor: negro,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            style: const TextStyle(fontSize: 17, fontFamily: poppinsR),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontFamily: poppinsR, color: Colors.black87),
              hintStyle: TextStyle(fontFamily: poppinsL, color: Colors.black87),
              floatingLabelStyle: TextStyle(color: azul2, fontFamily: poppinsL),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: marca1
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: azul2
                ),
              ),
              hintText: userName,  
              labelText: nameOrUser, 
              prefixIcon: Icon(Icons.person, color: marca1,),
            ),
            validator: (value) {
              return (value != null && value.isNotEmpty && value != '') 
              ? null
              :'Este campo es requerido';
            },
          ),
          TextFormField(
            cursorColor: negro,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            style: const TextStyle(fontSize: 17, fontFamily: poppinsR),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontFamily: poppinsR, color: Colors.black87),
              hintStyle: TextStyle(fontFamily: poppinsL, color: Colors.black87),
              floatingLabelStyle: TextStyle(color: azul2, fontFamily: poppinsL),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: marca1
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: azul2
                ),
              ),
              hintText: userEmail,  
              labelText: emailForm, 
              prefixIcon: Icon(Icons.email, color: marca1,),
            ),
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
              ? null
              :'El correo no es valido';
            },
            onChanged: (value) => signUpForm.email = value,
          ),
          SizedBox(height: size.height * 0.01,),
          TextFormField(
            cursorColor: negro,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: const TextStyle(fontSize: 17, fontFamily: poppinsR),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontFamily: poppinsR, color: Colors.black87),
              hintStyle: TextStyle(fontFamily: poppinsL, color: Colors.black87),
              floatingLabelStyle: TextStyle(color: azul2, fontFamily: poppinsL),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: marca1
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: azul2
                ),
              ),
              hintText: securityPassword2,  
              labelText: passwordText, 
              prefixIcon: Icon(Icons.password, color: marca1,),
            ),
            validator: (value) {
              String pattern = r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,12}$';
              RegExp regExp  = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
              ? null
              :'La contraseña no es valida';
            },
            onChanged: (value) => signUpForm.password = value,
          ),
          TextFormField(
            cursorColor: negro,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: const TextStyle(fontSize: 17, fontFamily: poppinsR),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontFamily: poppinsR, color: Colors.black87),
              hintStyle: TextStyle(fontFamily: poppinsL, color: Colors.black87),
              floatingLabelStyle: TextStyle(color: azul2, fontFamily: poppinsL),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: marca1
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: azul2
                ),
              ),
              hintText: securityPassword3,  
              labelText: securityPassword4, 
              prefixIcon: Icon(Icons.security, color: marca1,),
            ),
            validator: (value) {
              return (value == signUpForm.password) 
              ? null
              : 'Las contraseñas no son iguales';
            },
          ),
          SizedBox(height: size.height * 0.03,),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 10,
              minimumSize: Size(size.width * 0.35, size.height * 0.05),
              backgroundColor: verde2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
            ),
            onPressed: signUpForm.isLoading || connectionStatus.status != ConnectionStatus.online 
            ? null 
            : () async {
              FocusScope.of(context).unfocus();
              signUpForm.isLoading = true;
              final authService = Provider.of<AuthServiceProvider>(context, listen: false);
              final String? resp = await authService.signUp(signUpForm.email, signUpForm.password);
              if(!signUpForm.isValidsigInUp()){
                signUpForm.isLoading = false;
                return;
              }
              if(resp != null){
                signUpForm.errorForm = true;
                signUpForm.isLoading = false;
                return;
              }
              signUpForm.errorForm = false;
              if(context.mounted) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const EmailVerificationScreen(),), (route) => false);
                signUpForm.isLoading = false;
                return;
              }
              return;
            },
            child: (signUpForm.isLoading) 
            ? const SizedBox(
              height:  25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: marca1,
              ),
            ) 
            : const Text(createAcount, style: TextStyle(fontSize: 18, color: negro, fontFamily: poppinsR),),
          )
        ]
      ),
    );
  }
}