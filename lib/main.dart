import 'package:firebase_core/firebase_core.dart';
import 'package:miprocesoapp/utils/connection_status/check_internet_conection_util.dart';
import 'package:miprocesoapp/utils/connection_status/conection_status_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/auth/firebase_auth_service.dart';
import 'package:miprocesoapp/auth/check_authh_screen.dart';
import 'package:miprocesoapp/auth/email_verification_screen.dart';
import 'package:miprocesoapp/auth/log_in_and_create_acount_screen.dart';
import 'package:miprocesoapp/utils/share_preferences/user_preferences.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

final internetChecker = CheckInternetConnection();

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(darkMode: Preferences.darkMode),),
        ChangeNotifierProvider(create: (context) => AuthServiceProvider(),),
        ChangeNotifierProvider(create: (context) => ConnectionStatusProvider(),)
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