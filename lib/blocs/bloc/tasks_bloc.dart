import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../bloc_exports.dart';

import '../../models/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState.empty()) {
    on<AddTask>((event, emit) {
      emit(
        TasksState(
          allTasks: List.from(state.allTasks)..add(event.task),
        ),
      );
    });

    on<UpdateTask>(_onUpdateTask);

    on<DeleteTask>((event, emit) {
      emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
    });
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
