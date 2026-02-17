import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
class OtpPage extends StatefulWidget {
  final String phone;
  final int otp;
  const OtpPage({super.key, required this.phone, required this.otp});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  String enteredOtp = '';

  void _checkOtp() {
    enteredOtp = _controllers.map((c) => c.text).join();
    if (enteredOtp.length == 4) {
      // Accept any 4-digit input
      Get.snackbar('Success', 'OTP Verified!');
      // Navigate to HomePage
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAll(() => const HomePage());
      });
    } else {
      Get.snackbar('Error', 'Incorrect OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP verification'),
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              "We've sent a verification code to",
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              '+91 ${widget.phone}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) {
                return Container(
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _controllers[i],
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(counterText: ''),
                    onChanged: (val) {
                      if (val.isNotEmpty && i < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (i == 3 && val.isNotEmpty) {
                        _checkOtp();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Text('Resend OTP in 28', style: TextStyle(color: Colors.grey[600])),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'We have sent a verification code to you via SMS',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
