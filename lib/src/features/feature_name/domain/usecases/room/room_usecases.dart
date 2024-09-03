import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/room_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/room_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_repository.dart';

class RoomUsecases {
  final RoomRepository _roomRepository;
  final MemberRepository _memberRepository;
  final UserRepository _userRepository;

  RoomUsecases(
      this._roomRepository,
      this._memberRepository,
      this._userRepository,);

  Future<void> createRoom(String roomId, String roomName, String creatorId,
      Map<String, MemberRole> members) async {
    UserEntity? user = await _userRepository.getUser(creatorId);
    if (user != null) {
      return _roomRepository.createRoom(roomId, roomName, creatorId);
    }
    throw Exception('User not found');
  }

  Future<RoomEntity> getRoom(String roomId) async {
    return _roomRepository.getRoom(roomId);
  }

  Future<void> setRoomName(
      String roomId, String userId, String newRroomName) async {
    if (await _memberRepository.isTeacher(roomId, userId)) {
      await _roomRepository.setRoomName(roomId, newRroomName);
    }
    throw Exception('Invalid access');
  }

  Future<void> privacyHandler(String roomId, String userId) async {
    if (await _memberRepository.isTeacher(roomId, userId)) {
      await _roomRepository.privacyHandler(roomId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeRoom(String roomId, String teacherId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId) &&
        await _memberRepository.isOnlyTeacherLeft(roomId)) {
      return _roomRepository.updateExistance(roomId);
    }
  }
}
