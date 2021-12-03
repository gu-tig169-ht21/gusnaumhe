import 'dart:core';


class Todo {
  String id;
  String title;
  bool value;

  Todo({
    required this.id,
    required this.title,
    this.value = false,
  });

  static Map<String, dynamic> toJson(Todo todo) {
    return {
      'id' : todo.id,
      'title': todo.title,
      'done' : todo.value,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'], 
      title: json['title'],
      value: json['done'],
      );
  }
}
