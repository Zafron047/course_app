import 'package:course_app/src/features/feature_name/domain/entities/room/invites/invite_entity.dart';

abstract class InviteRepository {
  // Create an invite for a specific room and user.
  Future<InviteEntity> createInvite(String roomId, String email);
  // Read invitation by room and email
  Future<bool> isInvited(String roomId, String userMail);
  // Retrieves an invite by its id.
  Future<InviteEntity> getInvite(String inviteId);
  // Retrieves all invites associated with a specific room.
  Future<List<InviteEntity>> getInvitesByRoom(String roomId);
  // Retrieves all invites associated with a specific user.
  Future<List<InviteEntity>> getInvitesByUser(String userId);
  // remove invitation by room and email
  Future<void> removeInvite(String roomId, String email);
}
