import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project3_ui/entities/user.dart';
import 'package:project3_ui/cubits/states/user_state.dart';
import 'package:project3_ui/repositories/users/implementation/mock_user_repository.dart';
import 'package:project3_ui/repositories/users/interface/user_repository.dart';
import 'package:get_it/get_it.dart';

class UserListCubit extends Cubit<UserState> {
  late UserRepository repo;
  UserListCubit() : super(UserInitialState()) {
    repo = GetIt.I<UserRepository>();
  }

  void loadUsers() async {
    try {
      final users = await _fetchUsers();
      emit(UsersLoadedState(users));
    } catch (e) {
      emit(UsersFailureState());
    }
  }

  // Query the assignment repo for the pending assignments
  Future<List<User>> _fetchUsers() async {
    // TODO: Implement fetching of assignments from API or database
    return repo.getAllUsers();
  }
}

class UserCreateCubit extends Cubit<UserState> {
  UserCreateCubit() : super(UserInitialState());

  void createUser(String username, String role) async {
    try {
      emit(UserLoadingState());
      final users = await _createUser(username, role);
      if (!users) throw Null;
      emit(UserCreatedState());
    } catch (e) {
      emit(UserCreateFailureState());
    }
  }

  void resetState() {
    emit(UserInitialState());
  }

  // This is bad and just for testing.
  // Need to depend on an abstraction, not this concrete implementation.
  final userRepo = MockUserRepository();

  // Query the assignment repo for the pending assignments
  Future<bool> _createUser(String username, String role) async {
    // TODO: Implement fetching of assignments from API or database
    return userRepo.createUser(username, role);
  }
}

class UserDeleteCubit extends Cubit<UserState> {
  UserDeleteCubit() : super(UserInitialState());

  void deleteUser(String username) async {
    try {
      emit(UserLoadingState());
      final success = await _deleteUser(username);
      if (!success) throw Null;
      emit(UserDeletedState());
    } catch (e) {
      emit(UserDeleteFailureState());
    }
  }

  void getAllUsers() async{
    try {
      emit(UserLoadingState());
      final list = await _getAllUsers();
      if (list.isEmpty) throw Null;
      emit(UsersLoadedState(list));
    } catch (e) {
      emit(UsersFailureState());
    }
  }

  void resetState() {
    emit(UserInitialState());
  }

  // This is bad and just for testing.
  // Need to depend on an abstraction, not this concrete implementation.
  final userRepo = MockUserRepository();

  // Query the assignment repo for the pending assignments
  Future<bool> _deleteUser(String username) async {
    // TODO: Implement fetching of assignments from API or database
    return userRepo.deleteUser(username);
  }

  Future<List<User>> _getAllUsers() async{
      return userRepo.getAllUsers();
  }
}
