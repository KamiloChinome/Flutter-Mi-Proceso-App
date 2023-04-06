import 'package:firebase_core/firebase_core.dart';
import 'package:miprocesoapp/routes/routes.dart';
import 'package:miprocesoapp/utils/connection_status/check_internet_conection_util.dart';
import 'package:miprocesoapp/utils/connection_status/conection_status_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/services/auth/firebase_auth_service.dart';
import 'package:miprocesoapp/utils/share_preferences/user_preferences.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';


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
      initialRoute: 'Home',
      routes: appRoutes,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}