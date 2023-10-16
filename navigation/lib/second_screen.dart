import 'package:flutter/material.dart';

class SecondScreenArguments {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;

  SecondScreenArguments({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
  });
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SecondScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as SecondScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'User Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'First Name: ${args.firstName}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Last Name: ${args.lastName}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email: ${args.email}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Gender: ${args.gender == 'male' ? 'Male' : 'Female'}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Age: ${args.age}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
