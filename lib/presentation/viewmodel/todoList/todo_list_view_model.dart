import 'package:flutter/material.dart';
import 'package:flutter_samples/domain/todo_list/entity/todo_item.dart';
import 'package:flutter_samples/presentation/pages/todo_list/todo_detail_page.dart';
import 'package:flutter_samples/presentation/widgets/confirm_dialog.dart';
import 'package:flutter_samples/providers/todo_item_provider.dart';
import 'package:flutter_samples/usecase/todo_list/todo_list_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../usecase/todo_list/presenter/todo_list_state.dart';

class TodoListViewModel extends StateNotifier<TodoListState> {
  TodoListViewModel({required TodoListUsecase todoListUsecase})
      : _todoListUsecase = todoListUsecase,
        super(const TodoListState());

  final TodoListUsecase _todoListUsecase;

  void init() {
    state = state.copyWith(isFetching: true);
  }

  Stream<List<TodoItem>> get todoListStream => _todoListUsecase.getTodoList();

  void onTapItem(BuildContext context, WidgetRef ref, TodoItem item) {
    ref.read(todoDetailViewModelProvider.notifier).setTodoItem(item);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const TodoDetailPage(),
      ),
    );
  }

  Future<void> onLongPressItem({
    required BuildContext context,
    required TodoItem item,
  }) async {
    final result = await showDialog(
        context: context,
        builder: (context) {
          return const ConfirmDialog(title: '削除してもよろしいですか？');
        });
    if (result) await _todoListUsecase.deleteTodoItem(todoId: item.id);
  }

  Future<void> onTapCheckBox({required TodoItem item}) async {
    await _todoListUsecase.updateIsDone(todoId: item.id);
  }

  void onTapFAB(BuildContext context, WidgetRef ref) {
    ref.read(todoDetailViewModelProvider.notifier).reset();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TodoDetailPage()));
  }
}
