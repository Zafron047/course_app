import 'package:course_app/src/features/feature_name/domain/entities/room/invites/invite_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/invites/invite_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_repository.dart';

class InviteUsecases {
  final InviteRepository inviteRepository;
  final MemberRepository memberRepository;
  final UserRepository userRepository;
  InviteUsecases(
      this.inviteRepository, this.memberRepository, this.userRepository);

  Future<InviteEntity> sendInvite(String roomId, String email) {
    return inviteRepository.createInvite(roomId, email);
  }

  Future<void> acceptInvite(String inviteId) async {
    final invite = await inviteRepository.getInvite(inviteId);
    final user = await userRepository.getUser(invite.email);
    String? userId = user!.userId;

    await memberRepository.addMember(invite.roomId, userId);
    await inviteRepository.removeInvite(invite.roomId, invite.email);
  }

  Future<void> declineInvite(String inviteId) async {
    final invite = await inviteRepository.getInvite(inviteId);
    return inviteRepository.removeInvite(invite.roomId, invite.email);
  }

  Future<void> cancelInvite(String inviteId) async {
    final invite = await inviteRepository.getInvite(inviteId);
    return inviteRepository.removeInvite(invite.roomId, invite.email);
  }

  Future<List<InviteEntity>> getRoomInvites(
      String roomId, String teacherId) async {
    if (!await memberRepository.isTeacher(roomId, teacherId)) {
      throw Exception('User is not a teacher');
    }
    return inviteRepository.getInvitesByRoom(roomId);
  }

  // get invitations list by user
  Future<List<InviteEntity>> getUserInvites(String userId) async {
    return await inviteRepository.getInvitesByUser(userId);
  }
}
