import 'package:flutter_samples/domain/todo_list/entity/todo_item.dart';
import 'package:flutter_samples/domain/todo_list/vo/detail.dart';
import 'package:flutter_samples/domain/todo_list/vo/title.dart';
import 'package:flutter_samples/domain/todo_list/vo/todo_id.dart';
import 'package:flutter_samples/usecase/todo_list/todo_list_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoDetailViewModel extends StateNotifier<TodoItem> {
  TodoDetailViewModel({
    required TodoListUsecase todoListUsecase,
  })  : _todoListUsecase = todoListUsecase,
        super(TodoItem.initial(item: null));

  final TodoListUsecase _todoListUsecase;

  void reset() {
    state = TodoItem.initial(item: null);
  }

  bool isNew() {
    return state.id == const TodoId(null);
  }

  void setTodoItem(TodoItem item) {
    state = item.copyWith(
      id: item.id,
      title: item.title,
      detail: item.detail,
      createdAt: item.createdAt,
      isDone: item.isDone,
    );
  }

  void changeTitle(String title) {
    state = state.copyWith(
      id: state.id,
      title: Title(title),
      detail: state.detail,
      createdAt: state.createdAt,
      isDone: state.isDone,
    );
  }

  void changeDetail(String detail) {
    state = state.copyWith(
      id: state.id,
      title: state.title,
      detail: Detail(detail),
      createdAt: state.createdAt,
      isDone: state.isDone,
    );
  }

  Future<void> onTapElevatedButton() async {
    if (isNew()) {
      await _todoListUsecase.createTodoItem(item: state);
    } else {
      await _todoListUsecase.updateTodoItem(item: state);
    }
  }
}
