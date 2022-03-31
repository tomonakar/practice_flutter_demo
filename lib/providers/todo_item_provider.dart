import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infra/repository/todo_list_repository.dart';

final todoListRepositoryProvider =
    Provider.autoDispose((ref) => TodoListRepository());
