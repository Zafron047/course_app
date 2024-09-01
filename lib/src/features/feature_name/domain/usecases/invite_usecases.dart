import 'package:course_app/src/features/feature_name/domain/entities/room/invites/invite_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/invites/invite_repository.dart';

class InviteUsecases {
  final InviteRepository inviteRepository;

  InviteUsecases(this.inviteRepository);

  Future<InviteEntity> sendInvite(String roomId, String email) {
    return inviteRepository.addInvite(roomId, email);
  }

  Future<void> acceptInvite(String inviteId) {
    return inviteRepository.acceptInvite(inviteId);
  }

  Future<void> declineInvite(String inviteId) {
    return inviteRepository.declineInvite(inviteId);
  }

  Future<void> cancelInvite(String inviteId) {
    return inviteRepository.cancelInvite(inviteId);
  }

  Future<List<InviteEntity>> getRoomInvites(String roomId) {
    return inviteRepository.getRoomInvites(roomId);
  }

  Future<List<InviteEntity>> getUserInvites(String userId) {
    return inviteRepository.getUserInvites(userId); // get invitations list by user
  }
}
