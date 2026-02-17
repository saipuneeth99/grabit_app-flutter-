import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_pages/login_page.dart';

void main() {
  runApp(const BlinkitApp());
}

class BlinkitApp extends StatelessWidget {
  const BlinkitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3),()  {
        Get.off(() => const LoginPage());
      });
    });
    return Scaffold(
      backgroundColor: const Color(0xFF2ECC71),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                  color: Color(0XFFFFFFFF),
                ),
                children: [
                  const TextSpan(text: 'grab'),
                  TextSpan(
                    text: 'it',
                    style: TextStyle(color: Color(0XFF39FF14)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Last Minute App",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "A STUDENT PROJECT",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],

        ),
      ),
    );
  }
}
