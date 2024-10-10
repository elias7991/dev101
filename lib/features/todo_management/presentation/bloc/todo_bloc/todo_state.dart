part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({
    required this.todoState,
    this.tasks,
    this.errorMsg,
  });

  final BlocStateEnum todoState;
  final TodoEntity? tasks;
  final String? errorMsg;

  TodoState copyWith({
    required BlocStateEnum todoState,
    TodoEntity? tasks,
    String? errorMsg,
  }) {
    return TodoState(
      todoState: todoState,
      tasks: tasks ?? this.tasks,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [todoState, tasks, errorMsg];
}
