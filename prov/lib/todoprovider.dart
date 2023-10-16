import 'package:flutter/material.dart';
import 'package:prov/todo.dart';

class TdoProvider extends ChangeNotifier{
  List<Todo> todos = [];
  
  //arrow code of geter method in one line 
  List<Todo> get todolist => todos;


  addTodo(Todo todo){
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(int index){
    todos.removeAt(index);
    notifyListeners();
  }

  toggleIsdone(int index){
    todolist[index].isDone = !todolist[index].isDone;
    notifyListeners();
  }
  
//geter method used to get the value using the full implementation

  // List<Todo> getTodos(){
  //   List<Todo> todolist = todos;
  //   return todolist;
  // }

}