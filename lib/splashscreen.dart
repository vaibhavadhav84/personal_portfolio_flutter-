import 'package:flutter/material.dart';
import 'package:personal_portfolio/View/portfolio_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PortfolioPage()),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/splash_image1.png',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
