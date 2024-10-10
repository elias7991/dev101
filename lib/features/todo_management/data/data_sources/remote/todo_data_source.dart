import 'package:dev101/core/network/clients/clients.dart';
import 'package:dev101/features/todo_management/data/models/models.dart';

abstract class TodoDataSource {
  Future<LR<TodoModel>> fetchTasks();
}

class TodoRemoteDataSource implements TodoDataSource {
  TodoRemoteDataSource({required this.client});

  final DioClient client;

  @override
  Future<LR<TodoModel>> fetchTasks() async {
    const endpoint = '/api/v1/task';

    return client.get(
      endpoint,
      fromList: TodoModel.fromJson,
    );
  }
}
