import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_page.dart';

void main() {
  runApp(
    const MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final productImages = [
    'assets/images/dates.jpg',
    'assets/images/oil.jpg',
    'assets/images/shampoo.jpg',
    'assets/images/rice.jpg',
    'assets/images/moisturizer.jpg',
    'assets/images/atta.jpg',
    'assets/images/bread.jpg',
    'assets/images/butter.jpg',
    'assets/images/cooldrink.jpg',
    'assets/images/maggi.jpg',
    'assets/images/sugar.jpg',
    'assets/images/tea.jpg',
  ];

  late final ScrollController _scrollController;
  late Timer _timer;
  double _scrollPosition = 0;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_scrollController.hasClients) {
        _scrollPosition += 1;
        if (_scrollPosition > _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0;
        }
        _scrollController.jumpTo(_scrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onContinue() {
    String phone = _phoneController.text.trim();
    if (phone.length == 10) {
      // Generate random 4-digit OTP
      int otp = 1000 + Random().nextInt(9000);
      // Navigate to OTP page
      Get.to(() => OtpPage(phone: phone, otp: otp));
    } else {
      // Show error
      Get.snackbar('Error', 'Enter a valid 10-digit number');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate number of rows based on available height
    final columns = 3;
    final rows = (productImages.length / columns).ceil();
    List<List<String>> grid = List.generate(rows, (row) => []);
    for (int i = 0; i < productImages.length; i++) {
      grid[i ~/ columns].add(productImages[i]);
    }
    // Repeat images for seamless loop
    final repeatedImages = [
      ...productImages,
      ...productImages,
      ...productImages,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Horizontally auto-scrolling grid
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final columns = 3;
                  final rows = (productImages.length / columns).ceil();
                  final itemWidth = constraints.maxWidth / columns;
                  final itemHeight = constraints.maxHeight / rows;
                  final repeatedImages = [
                    ...productImages,
                    ...productImages,
                    ...productImages,
                  ];
                  return ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: repeatedImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: List.generate(rows, (rowIdx) {
                          int imgIdx =
                              (index + rowIdx * columns) %
                              repeatedImages.length;
                          return Container(
                            width: itemWidth,
                            height: itemHeight,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFFFFA),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Image.asset(
                                repeatedImages[imgIdx],
                                width: itemWidth * 0.7,
                                height: itemHeight * 0.7,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error, color: Colors.red),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Login section (not in Expanded)
            // Blinkit logo
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2ECC71),
                borderRadius: BorderRadius.circular(16),
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
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
            ),
            const SizedBox(height: 16),
            const Text(
              "Last Minute App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Log in or sign up",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: const Text('+91', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black26),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String phone = _phoneController.text.trim();
                    if (phone.length == 10) {
                      int otp = 1000 + Random().nextInt(9000); // random 4-digit OTP
                      print('OTP: $otp'); // For testing, see OTP in console
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpPage(phone: phone, otp: otp),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enter a valid 10-digit number')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "By continuing, you agree to our Terms of service & Privacy policy",
                style: TextStyle(fontSize: 11, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
