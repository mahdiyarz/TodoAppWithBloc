part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  const TasksState({required this.allTasks});

  const TasksState.empty() : allTasks = const [];

  @override
  List<Object> get props => [allTasks];
}
