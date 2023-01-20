import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../widgets/task_list_builder.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.allTasks;
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
      },
    );
  }
}
