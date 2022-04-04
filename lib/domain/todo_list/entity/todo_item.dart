import 'package:flutter_samples/domain/todo_list/vo/detail.dart';
import 'package:flutter_samples/domain/todo_list/vo/title.dart';
import 'package:flutter_samples/domain/todo_list/vo/todo_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/date_time_converter.dart';

part 'todo_item.freezed.dart';

part 'todo_item.g.dart';

@freezed
class TodoItem with _$TodoItem {
  const TodoItem._();

  factory TodoItem({
    @TodoIdConverter() required TodoId id,
    @TitleConverter() required Title title,
    @DetailConverter() required Detail detail,
    @Default(false) bool isDone,
    @DateTimeConverter() required DateTime createdAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  factory TodoItem.initial({TodoItem? item}) {
    if (item == null) {
      return TodoItem(
        id: const TodoId(null),
        title: const Title(''),
        detail: const Detail(''),
        createdAt: DateTime.now(),
        isDone: false,
      );
    }
    return TodoItem(
      id: item.id,
      title: item.title,
      detail: item.detail,
      createdAt: DateTime.now(),
      isDone: item.isDone,
    );
  }

  factory TodoItem.fromMap(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw StateError('todoItemId: $documentId のデータが存在しません');
    }
    return TodoItem(
      id: TodoId(documentId),
      title: Title(data['title']),
      detail: Detail(data['detail']),
      isDone: data['isDone'],
      createdAt: DateTime.parse(data['createdAt']),
    );
  }

  TodoItem updateIsDone() {
    return copyWith(
      id: id,
      title: title,
      detail: detail,
      isDone: !isDone,
    );
  }
}
