import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gesture(),
    );
  }
}

class Gesture extends StatefulWidget {
  const Gesture({super.key});

  @override
  State<Gesture> createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  int count = 1;
  bool _clicked = true;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture dection"),
      ),
      body: index == 0
          ? GestureDetector(
              child: Center(
                child: _clicked
                    ? Image.asset("images/abc1.jpg")
                    : Image.asset(
                        "images/website.jpg"),
              ),
              onTap: () {
                setState(() {
                  _clicked = !_clicked;
                });
              },
            )
          : Scaffold(
              body: Center(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: InteractiveViewer(child: Image.asset("images/abc1.jpg"))),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "change", icon: Icon(Icons.change_circle)),
          BottomNavigationBarItem(label: "zoom", icon: Icon(Icons.zoom_in)),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
