import 'package:finance/modules/auth/screens/codeVerification.dart';
import 'package:finance/modules/auth/screens/login.dart';
import 'package:finance/modules/auth/screens/register.dart';
import 'package:finance/modules/auth/screens/repeatPassword.dart';
import 'package:finance/modules/auth/screens/sendEmail.dart';
import 'package:finance/modules/home/screens/home.dart';
import 'package:finance/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:finance/widgets/splah_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplahScreen(),
        '/login': (context) => const Login(),
        '/send-email': (context) => const SendEmail(),
        '/code-verification': (context) => const CodeVerification(),
        '/repeat-password': (context) => const RepeatPassword(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/register': (context) => const Register(),
      },
    );
  }
}
