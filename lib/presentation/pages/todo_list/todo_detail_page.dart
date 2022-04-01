import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/providers/todo_item_provider.dart';

class TodoDetailPage extends ConsumerWidget {
  const TodoDetailPage({Key? key}) : super(key: key);

  get controller => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoDetailViewModelProvider);
    final notifier = ref.read(todoDetailViewModelProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: Text(notifier.isNew() ? '新規作成' : '編集'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'タイトル',
                  hintText: 'やること',
                ),
                onChanged: (title) {
                  notifier.changeTitle(title);
                },
                controller: TextEditingController(
                    text: notifier.isNew() ? '' : state.title.value),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: '詳細',
                  hintText: 'やることの詳細',
                ),
                onChanged: (detail) {
                  notifier.changeDetail(detail);
                },
                controller: TextEditingController(
                    text: notifier.isNew() ? '' : state.detail.value),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await notifier.onTapElevatedButton();
                  Navigator.pop(context);
                },
                child: Text(notifier.isNew() ? '作成' : '更新'),
              )
            ])));
  }
}
