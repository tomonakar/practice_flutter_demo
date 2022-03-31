import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/usecase/todo_list/todo_list_usecase.dart';

import '../../../usecase/todo_list/presenter/todo_list_state.dart';

class TodoListViewModel extends StateNotifier<TodoListState> {
  TodoListViewModel({required TodoListUsecase todoListUsecase})
      : _todoListUsecase = todoListUsecase,
        super(const TodoListState());

  final TodoListUsecase _todoListUsecase;

  void init() {
    state = state.copyWith(isFetching: true);
  }
}
