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
          pendingTasks: List.from(state.pendingTasks)..add(event.task),
          completeTasks: state.completeTasks,
          removedTasks: state.removedTasks,
        ),
      );
    });

    on<UpdateTask>(_onUpdateTask);
    on<DeleteAllTasks>(_onDeleteAllTasks);
    on<RecycleTask>(_onRecycleTask);
    on<FavoriteTask>(_onFavoriteTask);

    on<DeleteTask>((event, emit) {
      log('run DELETE Task');
      final state = this.state;
      final task = event.task;
      List<TaskModel> removedTasks = List.from(state.removedTasks)
        ..remove(task);

      emit(
        TasksState(
          pendingTasks: state.pendingTasks,
          completeTasks: state.completeTasks,
          favoriteTasks: state.favoriteTasks,
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
        List<TaskModel> pendingTasks = List.from(state.pendingTasks)
          ..remove(task);
        List<TaskModel> completeTasks = List.from(state.completeTasks)
          ..remove(task);
        List<TaskModel> favoriteTasks = List.from(state.favoriteTasks)
          ..remove(task);
        List<TaskModel> removedTasks = List.from(state.removedTasks)
          ..insert(
            0,
            task.copyWith(
              isDelete: true,
              isDone: false,
            ),
          );

        emit(
          TasksState(
            pendingTasks: pendingTasks,
            completeTasks: completeTasks,
            favoriteTasks: favoriteTasks,
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
    // final int index = state.pendingTasks.indexOf(task);
    List<TaskModel> pendingTasks = List.from(state.pendingTasks);
    List<TaskModel> completeTasks = List.from(state.completeTasks);

    task.isDone == false
        ? {
            completeTasks.insert(0, task.copyWith(isDone: true)),
            pendingTasks.remove(task),
          }
        : {
            completeTasks.remove(task),
            pendingTasks.insert(0, task.copyWith(isDone: false)),
          };

    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completeTasks: completeTasks,
        favoriteTasks: state.favoriteTasks,
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
        pendingTasks: state.pendingTasks,
        completeTasks: state.completeTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: const [],
      ),
    );
  }

  void _onRecycleTask(RecycleTask event, Emitter<TasksState> emit) {
    log('run recycle task');
    final state = this.state;
    final task = event.recycleTask;

    List<TaskModel> pendingTasks = List.from(state.pendingTasks)
      ..insert(
        0,
        task.copyWith(
          isDelete: false,
          isDone: false,
        ),
      );
    List<TaskModel> removedTasks = List.from(state.removedTasks)..remove(task);

    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completeTasks: state.completeTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: removedTasks,
      ),
    );
  }

  void _onFavoriteTask(FavoriteTask event, Emitter<TasksState> emit) {
    log('run favorite task');
    final state = this.state;
    final task = event.favoriteTask;
    List<TaskModel> pendingTasks = List.from(state.pendingTasks);
    List<TaskModel> completeTasks = List.from(state.completeTasks);
    List<TaskModel> favoriteTasks = List.from(state.favoriteTasks);

    if (task.isDone == false) {
      if (task.isFavorite == false) {
        final int index = pendingTasks.indexOf(task);
        pendingTasks
          ..remove(task)
          ..insert(index, task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, task.copyWith(isFavorite: true));
      } else {
        final int index = pendingTasks.indexOf(task);
        pendingTasks
          ..remove(task)
          ..insert(index, task.copyWith(isFavorite: false));
        favoriteTasks.remove(task);
      }
    } else {
      if (task.isFavorite == false) {
        final int index = completeTasks.indexOf(task);
        completeTasks
          ..remove(task)
          ..insert(index, task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, task.copyWith(isFavorite: true));
      } else {
        final int index = completeTasks.indexOf(task);
        completeTasks
          ..remove(task)
          ..insert(index, task.copyWith(isFavorite: false));
        favoriteTasks.remove(task);
      }
    }

    emit(
      TasksState(
        pendingTasks: pendingTasks,
        completeTasks: completeTasks,
        favoriteTasks: favoriteTasks,
        removedTasks: state.removedTasks,
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
