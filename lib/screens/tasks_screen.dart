import 'package:flutter/material.dart';

import '../models/tasks_model.dart';
import '../widgets/task_list_builder.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  List<TaskModel> tasksList = [
    TaskModel(title: 'task1'),
    TaskModel(title: 'task2'),
    TaskModel(title: 'task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text('Tasks:'),
            ),
          ),
          TasksListBuilder(tasksList: tasksList)
        ],
      ),
    );
  }
}
