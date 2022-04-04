import 'package:flutter_samples/domain/todo_list/entity/todo_item.dart';

import '../vo/todo_id.dart';

abstract class ITodoListUsecase {
  Stream<List<TodoItem>> getTodoList();
  Future<TodoItem> findByTodoId({required TodoId todoId});
  Future<void> updateIsDone({required TodoId todoId});
  Future<void> updateTodoItem({required TodoItem item});
  Future<void> deleteTodoItem({required TodoId todoId});
  Future<void> createTodoItem({required TodoItem item});
}
