import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
import 'package:plantdoc/screens/home_screen.dart';
import 'screens/articles_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/calendar_screen.dart';
import 'package:plantdoc/screens/settings_screen.dart';
import 'package:plantdoc/screens/chaltbot.dart';
import 'package:plantdoc/screens/contactus.dart';
import 'package:plantdoc/screens/aboutus.dart';
import 'package:plantdoc/screens/iotdevices.dart';
import 'package:plantdoc/screens/faq_screen.dart';
import 'package:plantdoc/screens/tips.dart';
import 'package:plantdoc/pages/home_page.dart';
import 'package:plantdoc/screens/auth/login_screen.dart';
import 'package:plantdoc/screens/auth/LoginWithEmailScreen.dart';
import 'package:plantdoc/screens/auth/signup_screen.dart';
import 'package:plantdoc/screens/plant_page.dart';
// import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:plantdoc/util/firebase_config.dart'; // Import your Firebase configuration class
// import 'config_firebase.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     apiKey: FirebaseConfig.apiKey,
//     authDomain: FirebaseConfig.authDomain,
//     projectId: FirebaseConfig.projectId,
//     storageBucket: FirebaseConfig.storageBucket,
//     messagingSenderId: FirebaseConfig.messagingSenderId,
//     appId: FirebaseConfig.appId,
//     measurementId: FirebaseConfig.measurementId,
//   );
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: FirebaseConfig.apiKey,
      authDomain: FirebaseConfig.authDomain,
      projectId: FirebaseConfig.projectId,
      storageBucket: FirebaseConfig.storageBucket,
      messagingSenderId: FirebaseConfig.messagingSenderId,
      appId: FirebaseConfig.appId,
      // measurementId: FirebaseConfig.measurementId,
    ),
  );
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Doc',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => SplashScreen(),
        // '/login': (context) => LoginScreen(),
        '/loginn': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/articles': (context) => ArticlesScreen(),
        '/scan': (context) => ScanScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/settings': (context) => SettingsScreen(),
        '/chatbot': (context) => Chatbolt(),
        '/contactus': (context) => ContactScreen(),
        '/aboutus': (context) => AboutUsScreen(),
        '/iotdevices': (context) => HomePage(),
        '/faq': (context) => FAQScreen(),
        '/tips': (context) => TipsScreen(),
        '/loginwithemail': (context) => LoginWithEmailScreen(),
        '/signup': (context) => SignUpScreen(),
        '/plants': (context) => PlantPage(),

      },
    );
  }
}
