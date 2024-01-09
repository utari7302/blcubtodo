import 'package:blcubtodo/models/Todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit():super([]);

  void addTodo(String title){
    if(title.isEmpty){
      addError('Title cannot be empty');
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    // That will replace the existing todo, means only one todo is show
    //emit([todo]);
    //if we want to show all todos
    state.add(todo);
    emit([...state]); // OR emit([...state,todo]);
  } 

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
  
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}