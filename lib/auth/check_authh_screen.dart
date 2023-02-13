import 'package:flutter/material.dart';
import 'package:miprocesoapp/auth/auth_service.dart';
import 'package:miprocesoapp/auth/log_in_and_create_acount_screen.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServiceProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return const Text('');
            }
            if(snapshot.data == ''){
              Future.microtask(() {
              // Navigator.of(context).pushReplacementNamed('HomeScreen');
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (_, __, ___) => const LogInAndSignUpScreen(),
                transitionDuration: const Duration(seconds: 0)
              ));
            });
            }else{
              Future.microtask(() {
              // Navigator.of(context).pushReplacementNamed('HomeScreen');
              Navigator.pushReplacement(context, PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomeScreen(),
                transitionDuration: const Duration(seconds: 0)
              ));
            });
            }
            return Container();
          },
        )
      ),
    );
  }
}