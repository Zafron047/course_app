import 'package:course_app/src/features/feature_name/domain/entities/room/invites/invite_entity.dart';

abstract class InviteRepository {
  /// Sends an invite to a user via email for a specific room.
  Future<InviteEntity> addInvite(String roomId, String email);

  /// Accepts an invite based on its unique invite ID.
  Future<void> acceptInvite(String inviteId);

  /// Declines an invite based on its unique invite ID.
  Future<void> declineInvite(String inviteId);

  /// Cancels an invite that was sent by the room admin or teacher.
  Future<void> cancelInvite(String inviteId);

  /// Retrieves all invites associated with a specific room.
  Future<List<InviteEntity>> getRoomInvites(String roomId); // get invitations list by room

  /// Retrieves all invites associated with a specific user.
  Future<List<InviteEntity>> getUserInvites(String userId); // get invitations list by user
}
