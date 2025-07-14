import 'package:flutter/material.dart';
import 'package:school_bus/functions/validate_function.dart';
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

  void togglingTheLoginMode() {
    setState(() {
      loginMode = !loginMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
      ),
      body: Center(
        child: loginMode
            ? Card(
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
                              "Login",
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
                                  child: Column(
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
                                  )),
                            ),
                            TheElevatedButton(
                              onPressed: () {},
                              buttonText: "Login",
                            ),
                            TextButton(
                              onPressed: togglingTheLoginMode,
                              child: Text("Don't have an account? Signup"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: SigningUpWidget(
                  togglingLoginMode: togglingTheLoginMode,
                ),
              ),
      ),
    );
  }
}
