import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/textfield_rectangle.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
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
                    'Create your account now to chat and explore',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Image.asset(
                    'assets/images/signupIllustration.png',
                    height: size.height * 0.2,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Reusable(
                    hintText: 'Username',
                    keyboardType: TextInputType.name,
                    icon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    validattor: (val) {
                      if (!val!.isValidName) return 'Enter valid name';
                    },
                    controller: usernameController,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Reusable(
                    hintText: 'Email',
                    icon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [],
                    controller: emailController,
                    validattor: (val) {
                      if (!val!.isValidName) return 'Enter valid email';
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  Reusable(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    icon: const Icon(Icons.lock),
                    obscureText: true,
                    inputFormatters: [],
                    controller: passwordController,
                    validattor: (val) {
                      if (!val!.isValidPassword) return 'Enter valid password';
                    },
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 100),
                              content: Text('Processing data'),
                            ),
                          );
                        }
                        Navigator.pushNamed(
                          context,
                          Routes.loginScreen,
                        );
                      },
                      child: Text(
                        'CREATE ACCOUNT',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an existing account?',
                          style: Theme.of(context).textTheme.bodyLarge),
                      // SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Routes.loginScreen,
                        ),
                        child: Text(
                          'Login Here',
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
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
