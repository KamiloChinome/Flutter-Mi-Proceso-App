import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/global_widgets/global_outlined_button.dart';
import 'package:miprocesoapp/auth/login_or_create_acount_provider.dart';
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
    bool visible = Provider.of<LogInOrCreateAnAcountProvider>(context).visible;
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
                Provider.of<LogInOrCreateAnAcountProvider>(context, listen: false).visible = !visible;
              }, 
              child: Text(
                (visible == false) ? '$existingAccount \n $logIn' : createAnAcount,
                style: const TextStyle(
                  fontFamily: poppinsR,
                fontSize: 18, 
                color: azulrey
              ),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: size.height * ((visible == false) ? 0.001: 0.15)),
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
    bool visible = Provider.of<LogInOrCreateAnAcountProvider>(context).visible;
    final size = MediaQuery.of(context).size;
    return Column(
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
    return Form(
      child: Column(
        children: [
          const Text(logIn, style: TextStyle(color: negro, fontSize: 25, fontFamily: poppinsR),),
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
              labelText: password, 
              prefixIcon: Icon(Icons.password, color: marca1,),
            ),
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
      ),
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
    return Form(
      child: Column(
        children: [
          const Text(createAnAcount, style: TextStyle(fontSize: 25, color: negro, fontFamily: poppinsR),),
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
              labelText: password, 
              prefixIcon: Icon(Icons.password, color: marca1,),
            ),
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
          ),
          SizedBox(height: size.height * 0.03,),
          GlobalOutlinedButton(
            text: createAcount, 
            onPressed: (){
              //TODO: VALIDAR INFORMACION
              Navigator.pushNamed(context, 'EmailVerificationScreen');
            }
          ),
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


