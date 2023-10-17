import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String username;
  final String password;

  final String ph_number;
  final String confirm_password;
  final String email;
  final String dob;
  final String gender;

  const SuccessPage({
    super.key,
    required this.username,
    required this.password,
    required this.email,
    required this.dob,
    required this.gender,
    required this.confirm_password,
    required this.ph_number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Saved details"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Full Name: $username"),
          Text("Email: $email"),
          Text("Phone Number: $ph_number"),
          Text("Date of Birth: $dob"),
          Text("Gender: $gender"),
        ],
      ),
    );
  }
}