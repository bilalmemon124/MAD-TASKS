import 'package:flutter/material.dart';
import 'package:sqf/flu_model.dart';
import 'package:sqf/helper.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Helper? dbhelper;

  late Future<List<DataModel>> noteslist;

  @override
  void initState() {
    super.initState();
    dbhelper = Helper();
    loadData();
  }

  loadData() async {
    noteslist = dbhelper!.getNOteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes app"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: noteslist,
                builder: (context, AsyncSnapshot<List<DataModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,  ///list of datamodels it will tell that this number of datamodel objects are there in this
                      itemBuilder: (BuildContext context, int index) {
                        print("this is item numberis : ${index}");
                        return Dismissible(
                          key: ValueKey<int>(snapshot.data![index].id!),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete_forever),
                          ),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              dbhelper!.delete(snapshot.data![index].id!);
                              print("this is the updated number: ${index}");
                              
                              // snapshot.data!.remove(snapshot.data![index]);
                              loadData();
                            });
                          },
                          child: Card(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title:
                                  Text(snapshot.data![index].title.toString()),
                              subtitle: Text(
                                  snapshot.data![index].description.toString()),
                              trailing:
                                  Text(snapshot.data![index].age.toString()),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator()); // Loading indicator or any other UI you prefer
                  }
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbhelper?.insert(DataModel(
            title: 'First Note',
            age: 22,
            description: 'This is my first app',
            email: 'haoi@example.com',
          )).then((value) {
            print("data has been saved");
            setState(() {
              loadData();
            });
          }).onError((error, stackTrace) {
            print(stackTrace);
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
