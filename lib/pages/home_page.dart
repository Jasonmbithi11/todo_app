import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class Homepage extends StatefulWidget{
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _controller = TextEditingController();
  List toDoList = [
    ['Buy Milk', false],
    ['Buy Eggs', false],
    ['Buy Bread', false],
    ['Buy Butter', false],
  ];

  void checkBoxChanged(int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      _controller.clear();
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),

     body: ListView.builder(
      itemCount: toDoList.length,
      itemBuilder:(BuildContext context, index){
      return TodoList(
        taskName: toDoList[index][0],
        taskCompleted: toDoList[index][1],
        onChanged: (value)=> checkBoxChanged(index),
        deleteTask: (context) => deleteTask(index),
      );
     }),
     floatingActionButton: Row(
       children: [
         Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
            controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add a new task',
                filled: true,
                fillColor: const Color.fromARGB(255, 233, 198, 245),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.deepPurpleAccent,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  ),
            ),
          ),
          ),
         ),
          FloatingActionButton(
          onPressed: saveNewTask,
          child: Icon(Icons.add),
         ),
       ],
     ),
    );
}
}