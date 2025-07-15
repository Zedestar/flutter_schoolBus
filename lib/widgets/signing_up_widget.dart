import 'dart:io';

import 'package:flutter/material.dart';
import 'package:school_bus/functions/validate_function.dart';
import 'package:school_bus/widgets/costants.dart';
import 'package:school_bus/widgets/elevated_button.dart';
import 'package:school_bus/widgets/taking_pick_widget.dart';
import 'package:school_bus/widgets/text_form_field.dart';

class SigningUpWidget extends StatefulWidget {
  const SigningUpWidget({super.key, required this.togglingLoginMode});

  final VoidCallback togglingLoginMode;

  @override
  State<SigningUpWidget> createState() => _SigningUpWidgetState();
}

class _SigningUpWidgetState extends State<SigningUpWidget> {
  int _currentPage = 0;
  File? userImage;
  final _signUpFormKey = GlobalKey<FormState>();
  final widgetPageController = PageController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNUmberController = TextEditingController();

  @override
  void dispose() {
    widgetPageController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNUmberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> signupContent = [
      SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TheTextFormInput(
              labelText: "Username",
              hintText: "Enter your username",
              controller: usernameController,
              inputIcon: Icons.person,
              textVisibility: false,
              keyboardType: TextInputType.text,
              validator: validateUsername,
            ),
            TheTextFormInput(
              labelText: "Phone",
              hintText: "Enter your Number number",
              controller: phoneNUmberController,
              inputIcon: Icons.phone,
              textVisibility: false,
              keyboardType: TextInputType.phone,
              validator: validatePhoneNumber,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 160,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TheTextFormInput(
                labelText: "Email",
                hintText: "Enter your Email",
                controller: emailController,
                inputIcon: Icons.email,
                textVisibility: false,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              TakingPicWidget(
                userImageProfile: userImage,
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TheTextFormInput(
              labelText: "Password",
              hintText: "Enter your Password",
              controller: passwordController,
              inputIcon: Icons.password,
              textVisibility: true,
              keyboardType: TextInputType.text,
              validator: validatePassword,
            ),
            TheTextFormInput(
              labelText: "Password",
              hintText: "Confirm your password",
              controller: confirmPasswordController,
              inputIcon: Icons.password,
              textVisibility: true,
              keyboardType: TextInputType.text,
              validator: (value) => validateConfirmPassword(
                value: value,
                password: passwordController.text,
              ),
            ),
          ],
        ),
      ),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Signup",
              style: TextStyle(
                color: kcolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _signUpFormKey,
              child: SizedBox(
                height: 180,
                child: PageView.builder(
                  itemCount: signupContent.length,
                  controller: widgetPageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: signupContent[index],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TheElevatedButton(
                  onPressed: () {
                    widgetPageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  buttonText: "Back",
                ),
                ...List.generate(
                  signupContent.length,
                  (index) {
                    return AnimatedContainer(
                      height: 12,
                      width: index == _currentPage ? 24 : 12,
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      decoration: BoxDecoration(
                        color: index == _currentPage ? kcolor : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  },
                ),
                TheElevatedButton(
                  onPressed: () {
                    if (!_signUpFormKey.currentState!.validate()) {
                      return;
                    }
                    if (_currentPage == signupContent.length - 1) {
                      print("Ready to sign up boys");
                      print("The signup mode is activated");
                    }
                    widgetPageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  buttonText: _currentPage == signupContent.length - 1
                      ? "Signup"
                      : "Next",
                ),
              ],
            ),
            TextButton(
              onPressed: widget.togglingLoginMode,
              child: Text("Already have account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
