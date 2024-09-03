import '../../entities/room/user_presence_role_entity.dart';

abstract class UserPresenceRepository {
  Future<UserPresenceRoleEntity> getUserPresenceAndRole(String roomId, String userId);
}
