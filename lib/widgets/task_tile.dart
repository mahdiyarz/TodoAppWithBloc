import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  void _removeOrDeleteTask(BuildContext ctx, TaskModel taskModel) {
    if (taskModel.isDelete!) {
      return ctx.read<TasksBloc>().add(DeleteTask(task: taskModel));
    } else {
      return ctx.read<TasksBloc>().add(RemoveTask(task: taskModel));
    }
  }

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
      trailing: task.isDelete!
          ? IconButton(
              onPressed: () {
                context.read<TasksBloc>().add(RecycleTask(recycleTask: task));
              },
              icon: const Icon(Icons.refresh),
            )
          : Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
