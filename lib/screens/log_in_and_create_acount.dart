import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/global_widgets/global_outlined_button.dart';
import 'package:miprocesoapp/global_widgets/global_text_form_field.dart';
import 'package:miprocesoapp/providers/login_or_create_acount_provider.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/auth_page.dart';
import 'package:provider/provider.dart';

class LogInOrCreateAnAcountScreen extends StatelessWidget {
  
  const LogInOrCreateAnAcountScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInOrCreateAnAcountProvider(),
      child: const Scaffold(
        body: _Body()
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visible = Provider.of<LogInOrCreateAnAcountProvider>(context).visible;
    return AuthPage(
      percentage: (visible == false) ? 0.04: 0.22,
      buttonText: (visible == false) ? '$existingAccount \n logIn' : createAnAcount,
      onPressed: () {
        Provider.of<LogInOrCreateAnAcountProvider>(context, listen: false).visible = !visible;
      },
      logInForm: const _LoginForm(),
    );
  }
}


class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visible = Provider.of<LogInOrCreateAnAcountProvider>(context).visible;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Form(
        child: Column(
          children: [
            Visibility(
              visible: (visible == true) ? true : false,
              child: FadeInUp(
                from: 20,
                child: _CardContainer(
                  child: _LogIn(size: size)
                ),
              ),
            ),
            Visibility(
              visible: (visible == true) ? false : true,
              child: FadeInUp(
                from: 20,
                child: _CardContainer(
                  child: _CreateAnAcount(size: size)
                ),
              ),
            )
          ],
        ),
      ),
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
    return Column(
      children: [
        const Text(logIn, style: TextStyle(fontSize: 25),),
        const GlobalTextFormField(
          hintText: userEmail, 
          labelText: emailForm, 
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: size.height * 0.01,),
        const GlobalTextFormField(
          maxLines: 1,
          hintText: securityPassword, 
          labelText: password, 
          prefixIcon: Icons.password,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
        ),
        SizedBox(height: size.height * 0.03,),
        GlobalOutlinedButton(
          text: logIn, 
          onPressed: (){
            //TODO: VALIDAR INFORMACION
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
          }
        ),
      ]
    );
  }
}

class _CreateAnAcount extends StatelessWidget {
  const _CreateAnAcount({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(createAnAcount, style: TextStyle(fontSize: 25),),
        const GlobalTextFormField(
          hintText: userEmail, 
          labelText: nameOrUser, 
          prefixIcon: Icons.person,
        ),
        const GlobalTextFormField(
          hintText: userEmail, 
          labelText: emailForm, 
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: size.height * 0.01,),
        const GlobalTextFormField(
          maxLines: 1,
          hintText: securityPassword2, 
          labelText: password, 
          prefixIcon: Icons.password,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
        ),
        const GlobalTextFormField(
          maxLines: 1,
          hintText: securityPassword3, 
          labelText: securityPassword4, 
          prefixIcon: Icons.security,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
        ),
        SizedBox(height: size.height * 0.03,),
        GlobalOutlinedButton(
          text: createAcount, 
          onPressed: (){
            //TODO: VALIDAR INFORMACION
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
          }
        ),
      ]
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
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.03),
    width: double.infinity,
    decoration: _boxDecoration(),
    child: child,
    );
  }
}


