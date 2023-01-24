import 'package:flutter/material.dart';

import '../models/tasks_model.dart';
import 'task_tile.dart';

class TasksListBuilder extends StatelessWidget {
  const TasksListBuilder({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return TaskTile(task: task);
        },
      ),
    );
  }
}
