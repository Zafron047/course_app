import 'package:course_app/src/features/feature_name/domain/entities/user.dart';

abstract class UserRepository {
  Future<bool> iscredentialsValid(String userId, String name, String email);
  Future<User> createUser(String userId, String name, String email);
  Future<void> removeUser(String userId);
  Future<User> getUser(String userField);
}
