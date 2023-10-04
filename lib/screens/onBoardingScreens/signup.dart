import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/textfield_rectangle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
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
                    'Create your account now to chat and explore',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  y20,
                  Image.asset(
                    'assets/images/signupIllustration.png',
                    // height: 200,
                    fit: BoxFit.contain,
                  ),
                  y20,
                  Reusable(
                    hintText: 'Username',
                    keyboardType: TextInputType.name,
                    icon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      ),
                    ],
                    validattor: (value) {
                      if (value!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    controller: _usernameController,
                  ),
                  y20,
                  Reusable(
                    hintText: 'Email',
                    icon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [],
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
                    inputFormatters: [],
                    controller: _passwordController,
                    suffixIcon: InkWell(
                      child: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.secondary,
                      ),
                      onTap: () {
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
                                  UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(userCredential.user!.uid)
                                      .set({
                                    'username': _usernameController.text,
                                    'email': _emailController.text,
                                  });
                                  Navigator.pushNamed(
                                    context,
                                    Routes.loginScreen,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.failure,
                                      content: Text(
                                          e.message ?? 'Something went wrong'),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.background2,
                            ))
                          : Text(
                              'CREATE ACCOUNT',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                    ),
                  ),
                  y40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an existing account?',
                          style: Theme.of(context).textTheme.bodyLarge),
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


