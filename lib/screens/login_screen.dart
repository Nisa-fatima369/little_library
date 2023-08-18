import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/textfield_rectangle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                .copyWith(top: 80),
            constraints: const BoxConstraints(
              maxWidth: 400,
              minWidth: 150,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Little Library',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'Login now to explore what\'s good',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.02),
                Image.asset(
                  'assets/images/loginIllustration.png',
                  height: size.height * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: size.height * 0.02),
                const Reusable(
                  hintText: 'Email',
                  icon: Icon(Icons.email),
                ),
                SizedBox(height: size.height * 0.02),
                const Reusable(
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  height: 55,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.pageView);
                    },
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account yet?',
                        style: Theme.of(context).textTheme.bodyLarge),
                    // SizedBox(width: 10),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.signupScreen),
                      child: Text(
                        'Create Here',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
