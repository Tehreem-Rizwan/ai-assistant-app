import 'package:ai_assistant/controllers/auth_controller.dart';
import 'package:ai_assistant/screens/helper/global.dart';
import 'package:ai_assistant/screens/helper/pref.dart';
import 'package:ai_assistant/screens/home_page.dart';
import 'package:ai_assistant/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Pref.initialize();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  // Check login state
  bool isLogin = await checkUserLoginState();

  runApp(MyApp(isLogin: isLogin));
}

Future<bool> checkUserLoginState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLogin') ?? false;
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    authController.decideRoute();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: Pref.defaultTheme,
        title: appName,
        darkTheme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 1,
            centerTitle: true,
            titleTextStyle:
                TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          useMaterial3: true,
        ),
        home: isLogin ? HomePage() : SplashScreen());
  }
}

extension AppName on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
