import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muhammad Hassan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController ucontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  TextEditingController econtroller = TextEditingController();
  TextEditingController ccontroller = TextEditingController();
  TextEditingController phcontroller = TextEditingController();
  String email = " ";
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Registration Form"),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
          key: formkey,
          child: Column(children: [
            
            TextFormField(
              controller: ucontroller,
              decoration: const InputDecoration(
                  labelText: "Full Name ", border: OutlineInputBorder()),
              validator: (value) {
                if (value==null || value.isEmpty) {
                  return "Please enter your Name!!!";
                }
                return null;
              },
            ),
            TextFormField(
              controller: econtroller,
              decoration: const InputDecoration(labelText: 'Email Address'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            TextFormField(
              controller: pcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: ccontroller,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Confirm password", border: OutlineInputBorder()),
              validator: (value) {
                if (value != pcontroller.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            TextFormField(
              controller: phcontroller,
              decoration: const InputDecoration(
                  labelText: "Phone Number", border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone number!!!";
                }
                return null;
              },
            ),
            TextFormField(
              controller: dobController,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                hintText: 'DD-MM-YYYY',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date of Birth is required';
                }
                return null;
              },
            ),
            Row(

              children: [
                Text(
                  'Select Gender: ${_selectedGender.isEmpty ? "None" : _selectedGender}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: "male",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value.toString();
                    });
                  },
                ),
                const Text("Male"),
            
                Radio(
                  value: "female",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value.toString();
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            const SizedBox(height: 20),
    
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        username: ucontroller.text,
                        password: pcontroller.text,
                        confirm_password: ccontroller.text,
                        email: econtroller.text,
                        ph_number: phcontroller.text,
                        dob: dobController.text,
                        gender: _selectedGender,
                      ),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            )
          ])),
    );
  }
}