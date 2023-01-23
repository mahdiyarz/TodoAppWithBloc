part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<TaskModel> allTasks;
  const TasksState({required this.allTasks});

  const TasksState.empty() : allTasks = const [];

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<TaskModel>.from(
        (map['allTasks'] as List<int>).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
