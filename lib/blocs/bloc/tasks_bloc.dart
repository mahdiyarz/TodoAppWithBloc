import 'dart:developer' show log;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../bloc_exports.dart';

import '../../models/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(
          const TasksState(),
        ) {
    on<AddTask>((event, emit) {
      log('run AddTask');
      final state = this.state;
      emit(
        TasksState(
          allTasks: List.from(state.allTasks)..add(event.task),
          removedTasks: state.removedTasks,
        ),
      );
    });

    on<UpdateTask>(_onUpdateTask);
    on<DeleteAllTasks>(_onDeleteAllTasks);
    on<RecycleTask>(_onRecycleTask);

    on<DeleteTask>((event, emit) {
      log('run DELETE Task');
      final state = this.state;
      final task = event.task;
      List<TaskModel> removedTasks = List.from(state.removedTasks)
        ..remove(task);

      emit(
        TasksState(
          allTasks: state.allTasks,
          removedTasks: removedTasks,
        ),
      );
    });

    on<RemoveTask>(
      (event, emit) {
        log('run remove Task');
        final state = this.state;
        final task = event.task;
        // final int index = state.removedTasks.indexOf(task);
        List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
        List<TaskModel> removedTasks = List.from(state.removedTasks)
          ..add(task.copyWith(isDelete: true));

        emit(
          TasksState(
            allTasks: allTasks,
            removedTasks: removedTasks,
          ),
        );
      },
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    log('run UpdateTask');
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(
      TasksState(
        allTasks: allTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    log('run Delete all tasks');
    final state = this.state;
    // final task = event.deletedTasks;
    emit(
      TasksState(
        allTasks: state.allTasks,
        removedTasks: const [],
      ),
    );
  }

  void _onRecycleTask(RecycleTask event, Emitter<TasksState> emit) {
    log('run recycle task');
    final state = this.state;
    final task = event.recycleTask;
    final int index = state.removedTasks.indexOf(task);
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)
          ..insert(index, task.copyWith(isDelete: false)),
        removedTasks: List.from(state.removedTasks)..remove(task),
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    var myTaskState = TasksState.fromMap(json);

    return myTaskState;
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    var myTaskStateToJson = state.toMap();

    return myTaskStateToJson;
  }
}
