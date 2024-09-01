import 'package:course_app/src/features/feature_name/domain/entities/room/user_presence_role_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/blocklist/block_user_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/invites/invite_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/requests/request_repository.dart';

class UserPresenceAggregator {
  final MemberRepository memberRepository;
  final InviteRepository inviteRepository;
  final RequestRepository requestRepository;
  final BlockUserRepository blockRepository;

  UserPresenceAggregator({
    required this.memberRepository,
    required this.inviteRepository,
    required this.requestRepository,
    required this.blockRepository,
  });

  Future<UserPresenceRoleEntity> getUserPresenceAndRole(String roomId, String userId) async {
    final isMember = await memberRepository.isMember(roomId, userId);
    final isStudent = await memberRepository.isStudent(roomId, userId);
    final isTeacher = await memberRepository.isTeacher(roomId, userId);
    final isRequested = await requestRepository.isInRequest(roomId, userId);
    final isInvited = await inviteRepository.isInvited(roomId, userId);
    final isBlocked = await blockRepository.isBlocked(roomId, userId);

    return UserPresenceRoleEntity(
      isMember: isMember,
      isStudent: isStudent,
      isTeacher: isTeacher,
      isInvited: isInvited,
      isRequested: isRequested,
      isBlocked: isBlocked,
    );
  }
}
