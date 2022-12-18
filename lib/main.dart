import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/screens/add_process_screen.dart';
import 'package:miprocesoapp/screens/alarm_screen.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:miprocesoapp/screens/personal_information.dart';
import 'package:miprocesoapp/screens/plans_screen.dart';
import 'package:miprocesoapp/screens/acount_screen.dart';
import 'package:miprocesoapp/screens/process_screen.dart';
import 'package:miprocesoapp/values/texts.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      title: 'Material App',
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen':(context) => const HomeScreen(),
        'AddProcessScreen':(context) => const AddProcessScreen(),
        'UserProfile':(context) => const UserProfileScreen(),
        'AlarmScreen':(context) => const AlarmScreen(),
        'PlansScreen':(context) => const PlansScreen(),
        'PersonalInformation':(context) => const PersonalInformationScreen(),
        'ProcessDetails':(context) => const ProcessScreen(),
      },
      theme: ThemeData(
        fontFamily: poppinsR
      ),
    );
  }
}