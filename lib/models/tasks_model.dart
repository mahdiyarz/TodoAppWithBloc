import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDelete;
  TaskModel({
    required this.title,
    required this.id,
    this.isDone,
    this.isDelete,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDelete,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDelete': isDelete,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDelete: map['isDelete'] != null ? map['isDelete'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDone,
        isDelete,
      ];
}
