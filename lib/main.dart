import 'package:finance/modules/auth/screens/codeVerification.dart';
import 'package:finance/modules/auth/screens/login.dart';
import 'package:finance/modules/auth/screens/repeatPassword.dart';
import 'package:finance/modules/auth/screens/sendEmail.dart';
import 'package:flutter/material.dart';
import 'package:finance/widgets/splah_screen.dart';

void main() {
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
      },
    );
  }
}
