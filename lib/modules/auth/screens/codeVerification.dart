import 'package:flutter/material.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación de código'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_3.png',
                width: 100.0, height: 100.0, fit: BoxFit.cover),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _codeController,
              keyboardType: TextInputType.number, // Abre el teclado numérico
              decoration: const InputDecoration(
                labelText: 'Código',
                border: OutlineInputBorder(),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/repeat-password');
                },
                child: const Text('Verificar código'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
