import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/Appicon.png',
                color: AppColors.secondary,
                height: size.height * 0.05,
                fit: BoxFit.contain,
              ),
              // SizedBox(height: size.height * 0.02),
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
