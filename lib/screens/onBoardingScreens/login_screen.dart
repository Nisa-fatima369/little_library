import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/textfield_rectangle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isLoading = false;

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
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
                  y20,
                  Text(
                    'Login now to explore what\'s good',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  y20,
                  Image.asset(
                    'assets/images/loginIllustration.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  y20,
                  Reusable(
                    hintText: 'Email',
                    icon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: const [],
                    controller: _emailController,
                    validattor: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  y20,
                  Reusable(
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    icon: const Icon(Icons.lock),
                    obscureText: _isObscure,
                    inputFormatters: const [],
                    controller: _passwordController,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.secondary,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    validattor: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  y40,
                  SizedBox(
                    height: 55,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary),
                      ),
                      onPressed: _isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });

                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                  Navigator.pushReplacementNamed(
                                      context, Routes.pageView);
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Login failed: ${e.message}'),
                                  ));
                                } catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text('An unexpected error occurred.'),
                                  ));
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Text(
                              'LOGIN',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                    ),
                  ),
                  y40,
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
      ),
    );
  }
}
