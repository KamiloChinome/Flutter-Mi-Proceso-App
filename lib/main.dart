import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/auth/auth_service.dart';
import 'package:miprocesoapp/auth/check_authh_screen.dart';
import 'package:miprocesoapp/screens/acount_screen.dart';
import 'package:miprocesoapp/screens/add_process_screen.dart';
import 'package:miprocesoapp/screens/alarm_screen.dart';
import 'package:miprocesoapp/auth/email_verification_screen.dart';
import 'package:miprocesoapp/screens/home_screen.dart';
import 'package:miprocesoapp/auth/log_in_and_create_acount_screen.dart';
import 'package:miprocesoapp/screens/personal_information_screen.dart';
import 'package:miprocesoapp/screens/plans_screen.dart';
import 'package:miprocesoapp/screens/proceedings_information_screen.dart';
import 'package:miprocesoapp/screens/process_documents_screen.dart';
import 'package:miprocesoapp/screens/process_information_screen.dart';
import 'package:miprocesoapp/screens/process_screen.dart';
import 'package:miprocesoapp/screens/settings_screen.dart';
import 'package:miprocesoapp/share_preferences/user_preferences.dart';
import 'package:miprocesoapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(darkMode: Preferences.darkMode),),
        ChangeNotifierProvider(create: (context) => AuthServiceProvider(),)
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi proceso',
      initialRoute: 'CheckAuthScreen',
      routes: {
        'AddProcessScreen':(context) => const AddProcessScreen(),
        'CheckAuthScreen':(context) => const CheckAuthScreen(),
        'AlarmScreen':(context) => const AlarmScreen(),
        'HomeScreen':(context) => const HomeScreen(),
        'PersonalInformation':(context) => const PersonalInformationScreen(),
        'PlansScreen':(context) => const PlansScreen(),
        'proceedingsInformation':(context) => const ProceedingsInformationScreen(),
        'processDocument':(context) => const ProcessDocumentScreen(),
        'ProcessInformation':(context) => const ProcessInformationScreen(),
        'ProcessProceedings':(context) => const ProcessScreen(),
        'settings':(context) => const SettingsScreen(),
        'UserProfile':(context) => const UserProfileScreen(),
        'LogInAndSignUp':(context) => const LogInAndSignUpScreen(),
        'EmailVerificationScreen':(context) => const EmailVerificationScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}