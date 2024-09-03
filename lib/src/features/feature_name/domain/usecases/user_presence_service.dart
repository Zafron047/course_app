import 'package:course_app/src/features/feature_name/domain/repositories/room/room_blocklist/room_user_block_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/invites/invite_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/requests/request_repository.dart';

abstract class UserPresenceServiceImpl {
  final MemberRepository memberRepository;
  final InviteRepository inviteRepository;
  final RequestRepository requestRepository;
  final RoomUserBlockRepository blockRepository;

  UserPresenceServiceImpl({
    required this.memberRepository,
    required this.inviteRepository,
    required this.requestRepository,
    required this.blockRepository,
  });

  Future<bool> isMember(String roomId, String userId) async {
    return await memberRepository.isMember(roomId, userId);
  }

  Future<bool> isStudent(String roomId, String userId) async {
    return await memberRepository.isStudent(roomId, userId);
  }

  Future<bool> isTeacher(String roomId, String userId) async {
    return await memberRepository.isTeacher(roomId, userId);
  }

  Future<bool> isInvited(String roomId, String userId) async {
    return await inviteRepository.isInvited(roomId, userId);
  }

  Future<bool> isInRequest(String roomId, String userId) async {
    return await requestRepository.isInRequest(roomId, userId);
  }

  Future<bool> isBlocked(String roomId, String userId) async {
    return await blockRepository.isBlocked(roomId, userId);
  }
  
}
