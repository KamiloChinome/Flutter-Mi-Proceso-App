import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/screens/add_process_screen.dart';
import 'package:miprocesoapp/screens/alarm_screen.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:miprocesoapp/screens/personal_information.dart';
import 'package:miprocesoapp/screens/plans_screen.dart';
import 'package:miprocesoapp/screens/user_profile.dart';
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
      initialRoute: 'PersonalInformation',
      routes: {
        'HomeScreen':(context) => const HomeScreen(),
        'AddProcessScreen':(context) => const AddProcessScreen(),
        'UserProfile':(context) => const UserProfileScreen(),
        'AlarmScreen':(context) => const AlarmScreen(),
        'PlansScreen':(context) => const PlansScreen(),
        'PersonalInformation':(context) => const PersonalInformationScreen(),
      },
      theme: ThemeData(
        fontFamily: poppinsR
      ),
    );
  }
}