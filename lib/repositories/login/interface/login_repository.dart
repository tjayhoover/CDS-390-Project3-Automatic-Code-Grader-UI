import 'package:project3_ui/entities/user.dart';

abstract class LoginRepository {
  User? user;

  Future<User?> login(String username, String password);

  void setCurrentUser(User u);
  User? getCurrentUser();
}
