import 'package:flutter/material.dart';
import 'package:school_bus/widgets/text_form_field.dart';

class SigningUpWidget extends StatefulWidget {
  const SigningUpWidget({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.phoneNUmberController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.validateUsername,
    required this.validateEmail,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNUmberController;
  final String? Function(String?)? validateUsername;
  final String? Function(String?)? validateEmail;

  @override
  State<SigningUpWidget> createState() => _SigningUpWidgetState();
}

class _SigningUpWidgetState extends State<SigningUpWidget> {
  int _currentPage = 0;
  final widgetPageController = PageController();

  @override
  void dispose() {
    widgetPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> signupContent = [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TheTextFormInput(
            labelText: "Username",
            hintText: "Enter your username",
            controller: widget.usernameController,
            inputIcon: Icons.person,
            textVisibility: false,
            keyboardType: TextInputType.text,
            validator: widget.validateUsername,
          ),
          TheTextFormInput(
            labelText: "Email",
            hintText: "Enter your email",
            controller: widget.emailController,
            inputIcon: Icons.email,
            textVisibility: false,
            keyboardType: TextInputType.text,
            validator: widget.validateUsername,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TheTextFormInput(
            labelText: "Username",
            hintText: "Enter your username",
            controller: widget.usernameController,
            inputIcon: Icons.person,
            textVisibility: false,
            keyboardType: TextInputType.text,
            validator: widget.validateUsername,
          ),
          TheTextFormInput(
            labelText: "Email",
            hintText: "Enter your email",
            controller: widget.emailController,
            inputIcon: Icons.email,
            textVisibility: false,
            keyboardType: TextInputType.text,
            validator: widget.validateUsername,
          ),
        ],
      ),
    ];
    return PageView.builder(
        itemCount: signupContent.length,
        controller: widgetPageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return signupContent[index];
        });
  }
}
