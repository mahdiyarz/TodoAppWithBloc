import 'package:flutter/material.dart';
import 'package:todo_bloc/models/tasks_model.dart';

class MyPopupMenu extends StatelessWidget {
  final TaskModel task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  const MyPopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDelete == false
          ? (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  onTap: likeOrDislikeCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == true
                        ? const Icon(Icons.bookmark_border)
                        : const Icon(Icons.bookmark_add),
                    label: task.isFavorite == true
                        ? const Text('Remove from\nbookmark')
                        : const Text('Add to\nbookmark'),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                  ),
                ),
              ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore task'),
                  ),
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete forever'),
                  ),
                ),
              ],
    );
  }
}
