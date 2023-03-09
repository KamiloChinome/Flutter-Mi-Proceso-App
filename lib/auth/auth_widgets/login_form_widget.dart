import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/home_screen.dart';
import '../../utils/connection_status/check_internet_conection_util.dart';
import '../../utils/connection_status/conection_status_provider.dart';
import '../../utils/connection_status/warning_widget.dart';
import '../../utils/values/colors.dart';
import '../../utils/values/texts.dart';
import '../firebase_auth_service.dart';
import '../login_and_sign_up_provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginForm = Provider.of<LogInAndSignUpProvider>(context);
    final connectionStatus = Provider.of<ConnectionStatusProvider>(context);
    return Form(
      key: loginForm.logIn,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const Text(logInText, style: TextStyle(color: negro, fontSize: 25, fontFamily: poppinsR),),
          const WarningTextWidget(),
          Visibility(
            visible: loginForm.errorForm,
            child: const Text('Correo o contraseña incorrecta', style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: poppinsL),)),
          TextFormField(
            cursorColor: negro,
            style: const TextStyle(fontSize: 17, fontFamily: poppinsR),
            keyboardType: TextInputType.emailAddress,
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
            onChanged: (value) => loginForm.email = value,
          ),
          SizedBox(height: size.height * 0.01,),
          TextFormField(
            cursorColor: negro,
            keyboardType: TextInputType.emailAddress,
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
              hintText: securityPassword,  
              labelText: passwordText, 
              prefixIcon: Icon(Icons.password, color: marca1,),
            ),
            onChanged: (value) => loginForm.password = value,
          ),
          SizedBox(height: size.height * 0.03,),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              elevation: 10,
              minimumSize: Size(size.width * 0.35, size.height * 0.05),
              backgroundColor: verde2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
            ),
            onPressed: loginForm.isLoading || connectionStatus.status != ConnectionStatus.online 
            ? null 
            : () async {
              FocusScope.of(context).unfocus();
              loginForm.isLoading = true;
              final authService = Provider.of<AuthServiceProvider>(context, listen: false);
              final String? resp = await authService.logIn(loginForm.email, loginForm.password);
              if(!loginForm.isValidLogIn()){
                loginForm.isLoading = false;
                return;
              }
              if(resp != null){
                loginForm.errorForm = true;
                loginForm.isLoading = false;
                return;
              }
              loginForm.errorForm = false;
              if(context.mounted) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
                loginForm.isLoading = false;
                return;
              }
              return;
            },
            child: (loginForm.isLoading) 
            ? const SizedBox(
              height:  25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: marca1,
              ),
            ) 
            : const Text(logInText, style: TextStyle(fontSize: 18, color: negro, fontFamily: poppinsR),),
          )
        ]
      ),
    );
  }
}