import 'package:course_app/src/features/feature_name/domain/entities/user.dart';

abstract class UserRepository {
  Future<bool> iscredentialsValid(User user);
  Future<void> createUser(User user);
  Future<void> removeUser(User user);
  Future<User> getUser(User user);
}
