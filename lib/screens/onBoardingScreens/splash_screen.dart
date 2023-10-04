import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        navigate();
      },
    );
    super.initState();
  }

  void navigate() async {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.pageView);
    } else {
      Navigator.pushReplacementNamed(context, Routes.signupScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          constraints: const BoxConstraints(
            maxWidth: 400,
            minWidth: 150,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/Appicon.png',
                color: AppColors.secondary,
                height: 100,
                fit: BoxFit.contain,
              ),
              Text(
                'Little Library',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


