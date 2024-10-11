import 'dart:convert';

import 'package:dev101/core/services/services.dart';
import 'package:dev101/features/todo_management/data/models/models.dart';

abstract class SharedPreferencesDataSource {
  Future<TodoModel?> getTasks();
  Future<void> setTasks(TodoModel todo);
}

class SharedPreferencesLocalDataSource implements SharedPreferencesDataSource {
  SharedPreferencesLocalDataSource({required this.prefs});

  final SharedPreferencesService prefs;
  final String _key = 'todo_key';

  @override
  Future<TodoModel?> getTasks() async {
    String? todoString = await prefs.getData(_key);

    if (todoString != null) {
      return TodoModel.fromJson(jsonDecode(todoString));
    }
    return null;
  }

  @override
  Future<void> setTasks(TodoModel todo) async {
    String todoString = jsonEncode(todo.toJson());

    await prefs.saveData(_key, todoString);
  }
}
