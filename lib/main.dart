import 'package:flutter/material.dart';
import 'package:to_do_test/to_do_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<ToDoModel> toDoModels = [];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 600,
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        decoration:
                        InputDecoration(hintText: 'Write your to-do'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            toDoModels.add(ToDoModel(name: controller.text));
                          });
                        },
                        child: Text('Done'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoModels.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(toDoModels[index].name!),
            trailing: Checkbox(
              value: toDoModels[index].isFinished,
              onChanged: (value) {
                setState(() {
                  toDoModels[index].isFinished =
                  !toDoModels[index].isFinished!;

                });
              },
            ),
          );
        },
      ),
    );
  }
}
