import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = TaskModel(title: titleController.text);
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                  titleController.clear();
                },
                child: const Text('ADD'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
