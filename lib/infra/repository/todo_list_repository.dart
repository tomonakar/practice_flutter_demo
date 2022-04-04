import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_samples/domain/todo_list/repository/i_todo_list_repository.dart';
import 'package:flutter_samples/infra/repository/firestore_path.dart';
import 'package:flutter_samples/infra/repository/firestore_service.dart';

import '../../domain/todo_list/entity/todo_item.dart';

class TodoListRepository implements ITodoListRepository {
  final _service = FirestoreService.instance;

  @override
  Stream<List<TodoItem>> todoItemStream() => _service.collectionStream(
      path: FirestorePath.todoList(),
      builder: (data, documentId) => TodoItem.fromMap(data, documentId));

  @override
  Future<TodoItem> findById({required String id}) async {
    final doc = await _service.documentSnapshot(path: FirestorePath.todo(id));
    return TodoItem.fromJson(_jsonFromSnapshot(doc));
  }

  @override
  Future<void> create({required TodoItem item}) async {
    await _service.addData(
        path: FirestorePath.todoList(),
        data: _convertDateTimeToTimestamp(item.toJson()));
  }

  @override
  Future<void> update({required TodoItem item}) async {
    await _service.updateData(
        path: FirestorePath.todo(item.id.value),
        data: _convertDateTimeToTimestamp(item.toJson()));
  }

  @override
  Future<void> delete({required TodoItem item}) async {
    await _service.deleteData(path: FirestorePath.todo(item.id.value));
  }

  Map<String, dynamic> _convertDateTimeToTimestamp(Map<String, dynamic> json) {
    final createdAt = DateTime.parse(json['createdAt']);
    return {
      'id': json['id'],
      'title': json['title'],
      'detail': json['detail'],
      'isDone': json['isDone'],
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  Map<String, dynamic> _jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    final createdAt = (json['createdAt'] as Timestamp).toDate().toLocal();
    return {
      'id': json.id,
      'title': json['title'],
      'detail': json['detail'],
      'isDone': json['isDone'],
      'createdAt': createdAt.toString(),
    };
  }
}
