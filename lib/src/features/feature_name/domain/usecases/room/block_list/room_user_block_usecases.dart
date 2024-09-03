import '../../../repositories/room/room_blocklist/room_user_block_repository.dart';
import '../../../repositories/room/members/member_repository.dart';

class RoomUserBlockUsecases {
  final RoomUserBlockRepository _roomUserBlockRepository;
  final MemberRepository _memberRepository;

  RoomUserBlockUsecases(this._roomUserBlockRepository, this._memberRepository);

  // blockList collection uses block member repository
  Future<void> addToBlockList(
      String roomId, String teacherId, String userId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      _memberRepository.removeMember(roomId, userId);
      return _roomUserBlockRepository.addToBlockList(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeFromBlockList(
      String roomId, String teacherId, String userId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      return _roomUserBlockRepository.removeBlock(roomId, userId);
    }
    throw Exception('Invalid access');
  }
}
