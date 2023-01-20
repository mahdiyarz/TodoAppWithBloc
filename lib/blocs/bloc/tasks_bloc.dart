import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../models/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState.empty()) {
    on<AddTask>((event, emit) {
      emit(
        TasksState(
          allTasks: List.from(state.allTasks)..add(event.task),
        ),
      );
    });
    on<UpdateTask>((event, emit) {});
    on<DeleteTask>((event, emit) {});
  }
}
