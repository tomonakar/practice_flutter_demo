import '../entity/todo_item.dart';

abstract class ITodoListRepository {
  Stream<List<TodoItem>> todoItemStream();
  Future<TodoItem> findById({required String id});
  Future<void> create({required TodoItem item});
  Future<void> update({required TodoItem item});
  Future<void> delete({required TodoItem item});
}
