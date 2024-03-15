import 'package:cleanarsitek/presentation/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'login', 
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [Image.asset('assets/images/logo.png'),
            const SizedBox(height: 12),
            const Text('selamat datang', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            const Text('selamat datang di aplikasi edu\n'
            'aplikasi latihan soal dan konsultasi soal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            ],
            ),
            Column(
              children: [
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
              )), 
              child: const Text('login with google'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const HomeScreen(),
                )),
              child: const Text('login with apple'),
            ),
            const SizedBox(height: 40)
          ],
          ),
          ],
            ),
      ),
    );
  }
}