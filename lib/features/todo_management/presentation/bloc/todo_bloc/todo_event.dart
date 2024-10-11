part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class GetTodo extends TodoEvent {}

class UpdateTodo extends TodoEvent {
  const UpdateTodo({ required this.todo });

  final TodoEntity todo;
}
