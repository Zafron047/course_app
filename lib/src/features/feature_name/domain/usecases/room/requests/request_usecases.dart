
import '../../../repositories/room/room_blocklist/room_user_block_repository.dart';
import '../../../repositories/room/invites/invite_repository.dart';
import '../../../repositories/room/members/member_repository.dart';
import '../../../repositories/room/requests/request_repository.dart';

class RequestUsecase {
  final RequestRepository _requestRepository;
  final MemberRepository _memberRepository;
  final RoomUserBlockRepository _blockRepository;
  final InviteRepository _inviteRepository;

  RequestUsecase(this._requestRepository, this._memberRepository,
      this._blockRepository, this._inviteRepository);

  // requests collection member request repository
  Future<void> addRequest(String roomId, String userId) async {
    bool aMember = await _memberRepository.isMember(roomId, userId);
    bool isBlocked = await _blockRepository.isBlocked(roomId, userId);
    bool isRequested = await _requestRepository.isInRequest(roomId, userId);
    bool isInvited = await _inviteRepository.isInvited(roomId, userId);

    if (aMember || isBlocked || isRequested) {
      throw Exception(
          'Error sending request please contact room teacher for more information');
    } else if (isInvited) {
      await _memberRepository.addMember(roomId, userId);
      bool aMember = await _memberRepository.isMember(roomId, userId);
      if (aMember) {
        return await _requestRepository.removeRequest(roomId, userId);
      }
    }
    return _requestRepository.addRequest(roomId, userId);
  }

  Future<void> approveRequest(
      String teacherId, String roomId, String userId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      await _requestRepository.removeRequest(roomId, userId);
      await _memberRepository.addMember(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> declineRequest(
      String roomId, String teacherId, String userId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      return _requestRepository.removeRequest(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> undoRequest(String roomId, String userId) async {
    bool isRequested = await _requestRepository.isInRequest(roomId, userId);
    if (!isRequested) {
      throw Exception('Request not found');
    }
    return _requestRepository.removeRequest(roomId, userId);
  }
}