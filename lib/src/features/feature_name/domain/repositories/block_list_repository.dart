import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

abstract class BlockListRepository {
  Future<void> blockUser(String userId);
  Future<List<UserEntity>> getBlockList(String roomId);
  Future<void> unBlockUser(String userId);
}
