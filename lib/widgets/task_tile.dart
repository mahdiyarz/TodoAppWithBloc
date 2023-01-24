import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
          color: task.isDone! ? Colors.grey : Colors.black,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
      ),
      onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
    );
  }
}
