import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/auth/firebase_auth_service.dart';
import 'package:miprocesoapp/auth/email_verification_screen.dart';
import 'package:miprocesoapp/auth/login_and_sign_up_provider.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:miprocesoapp/utils/connection_status/check_internet_conection_util.dart';
import 'package:miprocesoapp/utils/connection_status/conection_status_provider.dart';
import 'package:miprocesoapp/utils/connection_status/warning_widget.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/widgets/auth_page.dart';
import 'package:provider/provider.dart';

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
                authFormService.errorForm = false;
              }, 
              child: Text(
                (authFormService.visible == false) ? '$existingAccount \n $logInText' : createAnAcount,
                style: const TextStyle(
                  fontFamily: poppinsR,
                fontSize: 18, 
                color: azulrey
              ),
              textAlign: TextAlign.center,
            )),
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
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Visibility(
          visible: (logInAndSignUpProvider.visible == true) ? true : false,
          child: FadeInUp(
            from: 20,
            child: _CardContainer(
              child: _LogIn(size: size)
            ),
          ),
        ),
        Visibility(
          visible: (logInAndSignUpProvider.visible == true) ? false : true,
          child: FadeInUp(
            from: 20,
            child: _CardContainer(
              child: _SignUp(size: size)
            ),
          ),
        )
      ],
    );
  }
}

class _LogIn extends StatelessWidget {
  const _LogIn({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
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

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    color: blanco,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );
}


class _CardContainer extends StatelessWidget {

  final Widget child;
  const _CardContainer({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.03),
    width: double.infinity,
    decoration: _boxDecoration(),
    child: child,
    );
  }
}


