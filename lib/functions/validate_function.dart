import 'package:flutter/material.dart';

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

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  }
  if (value.length < 3) {
    return 'Username must be at least 3 characters long';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter phone number to continue';
  }
  if (value != 13) {
    return "Phone number must contain 13 number";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Enter password to login";
  }
  return null;
}

String? validateConfirmPassword({String? value, required String password}) {
  if (value == null || value.isEmpty) {
    return "Confirm password to continue";
  }
  if (value != password) {
    return 'The two password didn\'t match';
  }
  return null;
}
