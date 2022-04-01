import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/providers/todo_item_provider.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListViewModelProvider);
    final viewModel = ref.read(todoListViewModelProvider.notifier);
    final todoListStream = ref.watch(todoListStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Page'),
      ),
      // body: ListView(
      // children: todoListStream.when(
      // data: (list) => list.map( (item) => InkWell(
      body: todoListStream.when(
        data: (list) => ListView(
          children: list
              .map(
                (item) => InkWell(
                  child: ListTile(
                    leading: Checkbox(
                      value: item.isDone,
                      onChanged: (bool? value) async {
                        await viewModel.onTapCheckBox(item: item);
                      },
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: item.title.value,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    viewModel.onTapItem(context, ref, item);
                  },
                  onLongPress: () async {
                    await viewModel.onLongPressItem(
                        context: context, item: item);
                  },
                ),
              )
              .toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onTapFAB(context, ref);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
