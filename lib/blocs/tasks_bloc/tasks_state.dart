part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  final List<TaskModel> removedTasks;
  const TasksState({
    this.allTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  // TasksState.empty() : allTasks = [];

  @override
  List<Object> get props => [
        allTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    var myTasksToMap = <String, dynamic>{
      'allTasks': allTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
    return myTasksToMap;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    var myTasks = TasksState(
      allTasks: (map['allTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
      removedTasks: (map['removedTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
    );
    return myTasks;
  }
}
