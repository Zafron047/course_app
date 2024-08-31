import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_repository.dart';

class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future<UserEntity> createUser(String userId, String name, String email) async {
    if (await _userRepository.iscredentialsValid(userId, name, email)) {
      return await _userRepository.createUser(userId, name, email);
    }
    throw Exception('Invalid credentials');
  }

  Future<UserEntity> getUser(String userId) async {
    return await _userRepository.getUser(userId);
  }

  Future<void> removeUser(String userId) async {
    return await _userRepository.removeUser(userId);
  }
}
