import 'package:dev101/features/todo_management/domain/entities/entities.dart';
import 'package:dev101/features/todo_management/domain/use_cases/use_cases.dart';
import 'package:dev101/features/todo_management/presentation/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required TodoUseCases todoUseCases,
  })  : _todoUseCases = todoUseCases,
        super(
          TodoState(
            todoState: BlocStateEnum.initial,
            tasks: TodoEntity.empty(),
          ),
        ) {
    on<GetTodo>(_onGetTodo);
    // on<UpdateTodo>(_onUpdateTodo);
  }

  final TodoUseCases _todoUseCases;

  Future<void> _onGetTodo(GetTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
      todoState: BlocStateEnum.loading,
    ));

    final tryTodo = await _todoUseCases.todoFromPrefsUseCase();
    if (tryTodo != null) {
      emit(state.copyWith(todoState: BlocStateEnum.loaded, tasks: tryTodo));
    } else {
      final todoResponse = await _todoUseCases.todoUseCase();

      todoResponse.fold(
        (l) async => emit(state.copyWith(todoState: BlocStateEnum.error)),
        (r) async {
          await _todoUseCases.saveTodoUseCase(r).whenComplete(() =>
              emit(state.copyWith(todoState: BlocStateEnum.loaded, tasks: r)));
        },
      );
    }
  }
}
