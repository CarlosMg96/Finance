import 'package:flutter/material.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/logo_3.png'),
      ),
    );
  }
}
