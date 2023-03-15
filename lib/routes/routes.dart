import 'package:flutter/material.dart';

import '../auth/check_authh_screen.dart';
import '../auth/email_verification_screen.dart';
import '../auth/log_in_and_create_acount_screen.dart';
import '../screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'AddProcessScreen':(context) => const AddProcessScreen(),
  'CheckAuthScreen':(context) => const CheckAuthScreen(),
  'AlarmScreen':(context) => const AlarmScreen(),
  'Home':(context) => const HomeScreen(),
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
};