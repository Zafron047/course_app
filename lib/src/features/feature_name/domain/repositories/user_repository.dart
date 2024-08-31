import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

abstract class UserRepository {
  Future<bool> iscredentialsValid(String userId, String name, String email);
  Future<UserEntity> createUser(String userId, String name, String email);
  Future<void> removeUser(String userId);
  Future<UserEntity> getUser(String userField);
}
