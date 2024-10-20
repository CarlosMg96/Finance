import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    void showSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_3.png',
                width: 100.0, height: 100.0, fit: BoxFit.cover),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    // showSnackBar("Usuario registrado: ${credential.user?.uid}");
                    Navigator.pushNamed(context, '/profile');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      // showSnackBar(
                      //     "The password provided is too weak.${e.code}");
                    } else if (e.code == 'email-already-in-use') {
                      // showSnackBar(
                      //     "The account already exists for that email.${e.code}");
                    }
                  } catch (e) {
                    print('Error: $e');
                    // showSnackBar("Error: $e");
                  }
                },
                child: const Text('Iniciar Sesión'),
              ),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send-email');
                print('Forgot password');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey, // Color del texto
              ),
              child: const Text('Recuperar contraseña'),
            ),
            OutlinedButton(
              onPressed: () {
                // ignore: avoid_print
                Navigator.pushNamed(context, '/register');
                print('Register');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide.none, // Color del texto
              ),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
