import 'package:flutter_samples/domain/todo_list/usecase/i_todo_list_usecase.dart';
import 'package:flutter_samples/infra/repository/todo_list_repository.dart';

import '../../domain/todo_list/entity/todo_item.dart';
import '../../domain/todo_list/vo/todo_id.dart';

class TodoListUsecase implements ITodoListUsecase {
  TodoListUsecase({required TodoListRepository todoListRepository})
      : _todoListRepository = todoListRepository;

  final TodoListRepository _todoListRepository;

  Stream<List<TodoItem>> getTodoList() => _todoListRepository.todoItemStream();

  Future<TodoItem> findByTodoId({required TodoId todoId}) async {
    return await _todoListRepository.findById(id: todoId.value ?? '');
  }

  Future<void> updateIsDone({required TodoId todoId}) async {
    final item = await _todoListRepository.findById(id: todoId.value ?? '');
    await _todoListRepository.update(item: item.updateIsDone());
  }

  Future<void> updateTodoItem({required TodoItem item}) async {
    await _todoListRepository.update(item: item);
  }

  Future<void> deleteTodoItem({required TodoId todoId}) async {
    final item = await _todoListRepository.findById(id: todoId.value ?? '');
    _todoListRepository.delete(item: item);
  }

  Future<void> createTodoItem() async {
    await _todoListRepository.create(item: TodoItem.initial());
  }
}
