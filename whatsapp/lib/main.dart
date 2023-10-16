import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  List app = ["User1", "User2", "User3"];

  int counter = 4;

  void add (){
    setState(() {
      app.add("user$counter");
      counter++;
    });
  }

  void remove (index){
    setState(() {
      app.removeAt(index);
       counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatApp"),
      ),
      body: ListView.builder(
        itemCount: app.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.face),
              title: Text(app[index].toString()),
              subtitle: const Text("Software engineer"),
              trailing: GestureDetector(
                onTap: () {
                  remove(index);
                },

                child: const Icon(Icons.remove),
              ),
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: add, child: const Icon(Icons.add),),
    );
  }
}