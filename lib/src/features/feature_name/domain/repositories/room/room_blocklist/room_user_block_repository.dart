import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

abstract class RoomUserBlockRepository {
  // Create
  Future<void> addToBlockList(String roomId, String userId);
  // Read
  Future<List<UserEntity>> getBlockList(String roomId);
  // Remove
  Future<void> removeBlock(String roomId, String userId);

  // helper functions
  Future<bool> isBlocked(String roomId, String userId);
}
