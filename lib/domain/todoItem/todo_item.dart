import 'package:flutter_samples/domain/todoItem/vo/detail.dart';
import 'package:flutter_samples/domain/todoItem/vo/title.dart';
import 'package:flutter_samples/domain/todoItem/vo/todo_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/date_time_converter.dart';

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

  factory TodoItem.initial() => TodoItem(
        id: const TodoId(null),
        title: const Title(""),
        detail: const Detail(""),
        createdAt: DateTime.now(),
      );

  TodoItem updateIsDone() {
    return copyWith(
      id: id,
      title: title,
      detail: detail,
      isDone: !isDone,
    );
  }
}
