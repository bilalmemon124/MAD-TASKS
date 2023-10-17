import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form/success_page.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  // _GenderSelectionState createState() => _GenderSelectionState();
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  TextEditingController dateInput = TextEditingController();
 
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
 
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController ucontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  TextEditingController econtroller = TextEditingController();
  String email = "";
  String _selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Registration Form")),
      body: Form(
          key: formkey,
          child: Column(children: [
            TextFormField(
              controller: ucontroller,
              decoration: const InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter some your Name!!!";
                }
                return null;
              },
            ),
            TextFormField(
               controller: econtroller,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // Check if this field is empty
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }

                // using regular expression
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }

                // the email is valid
                return null;
              },
            ),
            TextFormField(
              controller: pcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "DOB" //label text of field
                  ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  // ignore: avoid_print
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  if (kDebugMode) {
                    print(
                      formattedDate);
                  } //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
            //TextFormField(
              // controller: ucontroller,
            //  decoration: const InputDecoration(
               //   labelText: "DoB", border: OutlineInputBorder()),
             // validator: (value) {
               // if (value!.isEmpty) {
               //   return "Please enter your Date of Birth!!!";
              //  }
             //   return null;
           //   },
          //  ),
            Text(
              'Selected Gender: ${_selectedGender.isEmpty ? "None" : _selectedGender}',
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Radio(
                  value: "other",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value.toString();
                    });
                  },
                ),
                const Text("Other"),
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
            email: econtroller.text,
            dob: dateInput.text,
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