import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/domain/todo_list/entity/todo_item.dart';
import 'package:flutter_samples/presentation/viewmodel/todoList/todo_detail_view_model.dart';
import 'package:flutter_samples/presentation/viewmodel/todoList/todo_list_view_model.dart';
import 'package:flutter_samples/usecase/todo_list/presenter/todo_list_state.dart';

import '../infra/repository/todo_list_repository.dart';
import '../usecase/todo_list/todo_list_usecase.dart';

final todoListRepositoryProvider =
    Provider.autoDispose((ref) => TodoListRepository());

final todoListUsecaseProvider = Provider((ref) => TodoListUsecase(
      todoListRepository: ref.read(todoListRepositoryProvider),
    ));

final todoDetailViewModelProvider =
    StateNotifierProvider<TodoDetailViewModel, TodoItem>((ref) {
  return TodoDetailViewModel(
      todoListUsecase: ref.read(todoListUsecaseProvider));
});

final todoListViewModelProvider =
    StateNotifierProvider<TodoListViewModel, TodoListState>((ref) {
  return TodoListViewModel(
    todoListUsecase: ref.read(todoListUsecaseProvider),
  )..init();
});

final todoListStreamProvider =
    StreamProvider.autoDispose<List<TodoItem>>((ref) {
  final todoListUsecase = ref.read(todoListUsecaseProvider);
  final vm = TodoListViewModel(todoListUsecase: todoListUsecase);
  return vm.todoListStream;
});
