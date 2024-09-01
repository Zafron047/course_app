import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

abstract class BlockUserRepository {
  // CRUD
  // Create
  Future<void> addToBlockList(UserEntity user);
  // Read
  Future<List<UserEntity>> getBlockList(String roomId);
  // Remove
  Future<void> removeBlock(String userId);

  // helper functions
  Future<bool> isBlocked(String roomId, String userId);
}
