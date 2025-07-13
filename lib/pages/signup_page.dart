import 'package:flutter/material.dart';
import 'package:school_bus/widgets/costants.dart';
import 'package:school_bus/widgets/elevated_button.dart';
import 'package:school_bus/widgets/signing_up_widget.dart';
import 'package:school_bus/widgets/text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameCotroller = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool loginMode = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameCotroller.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter password to login";
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        loginMode ? "Login" : "Signup",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kcolor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 160,
                          child: loginMode
                              ? Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TheTextFormInput(
                                      labelText: "Username",
                                      hintText: "Enter your username",
                                      controller: usernameCotroller,
                                      inputIcon: Icons.person,
                                      textVisibility: false,
                                      keyboardType: TextInputType.text,
                                      validator: validateUsername,
                                    ),
                                    TheTextFormInput(
                                      labelText: "Password",
                                      hintText: "Enter your password",
                                      controller: passwordController,
                                      keyboardType: TextInputType.text,
                                      inputIcon: Icons.password,
                                      textVisibility: true,
                                      validator: validatePassword,
                                    ),
                                  ],
                                )
                              : SigningUpWidget(
                                  usernameController: usernameCotroller,
                                  emailController: emailController,
                                  phoneNUmberController: phoneNumberController,
                                  passwordController: passwordController,
                                  confirmPasswordController:
                                      confirmPasswordController,
                                  validateUsername: validateUsername,
                                  validateEmail: validateEmail,
                                ),
                        ),
                      ),
                      TheElevatedButton(
                        onPressed: () {
                          if (loginMode) {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            final username = usernameCotroller.text;
                            final password = passwordController.text;
                            print("$username $password");
                          } else {
                            print("Your on signup mode");
                          }
                        },
                        buttonText: loginMode ? "Login" : "Signup",
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            loginMode = !loginMode;
                          });
                        },
                        child: Text(loginMode
                            ? "Don't have an account? Signup"
                            : "Already have an account? login"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
