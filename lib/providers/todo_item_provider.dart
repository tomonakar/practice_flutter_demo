import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infra/repository/todo_list_repository.dart';
import '../usecase/todo_list/todo_list_usecase.dart';

final todoListRepositoryProvider =
    Provider.autoDispose((ref) => TodoListRepository());

final todoListUsecaseProvider = Provider((ref) => TodoListUsecase(
      todoListRepository: ref.read(todoListRepositoryProvider),
    ));
