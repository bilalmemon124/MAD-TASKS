import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final List<String> buttonLabels = [
    "%", "(", ")", "%",
    "7", "8", "9", "/",
    "4", "5", "6", "x",
    "1", "2", "3", "-",
    "0", ".", "=", "+",
  ];

  final List<String> buttonLabels2 = [
    "%", "(", ")", "%",
    "/", "x", "-", "+",
    ".", "=", "0", "1",
    "2", "3", "4", "5",
    "6", "7", "8", "9",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: SingleChildScrollView(
        physics:const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const TextFieldLikeContainer(),
            GridView.extent(
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 2.0,
              shrinkWrap: true, // Add this line
              physics: const NeverScrollableScrollPhysics(), // Add this line
              maxCrossAxisExtent:MediaQuery.of(context).orientation == Orientation.portrait ? height*0.13 : height*0.23,
              children:(MediaQuery.of(context).orientation == Orientation.portrait)? buttonLabels.map((label) {
                return ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList() : buttonLabels2.map((label) {
                return ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    label, 
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));
              } ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldLikeContainer extends StatefulWidget {
  const TextFieldLikeContainer({super.key});
  @override
  State<TextFieldLikeContainer> createState() => _TextFieldLikeContainerState();
}

class _TextFieldLikeContainerState extends State<TextFieldLikeContainer> {
  final TextEditingController _controller = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).orientation == Orientation.portrait ? 208 : 130,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextField(
          textDirection: TextDirection.rtl,
          controller: _controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          readOnly: true,
          style: const TextStyle(fontSize: 70),
        ),
      ),
    );
  }
}
