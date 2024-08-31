// import 'package:course_app/src/features/feature_name/domain/entities/room.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/room_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_presence.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_role_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_repository.dart';

class RoomUsecase {
  final RoomRepository _roomRepository;
  final UserRepository _userRepository;

  RoomUsecase(this._roomRepository, this._userRepository);

  // redundant helper method
  Future<UserPresence> getUserPresence(String roomId, String userField) async {
    UserEntity user = await _userRepository.getUser(userField);
    String userId = user.userId;
    String userMail = user.email;

    return UserPresence(
      isMember: await _roomRepository.isMember(roomId, userId),
      isInvited: await _roomRepository.isInvited(roomId, userMail),
      isRequested: await _roomRepository.requested(roomId, userId),
      isBlocked: await _roomRepository.isBlocked(roomId, userId),
    );
  }

  Future<void> setRoomName(
      String roomId, String userId, String newRroomName) async {
    if (await _roomRepository.isTeacher(roomId, userId)) {
      await _roomRepository.setRoomName(roomId, newRroomName);
    }
    throw Exception('Invalid access');
  }

  Future<void> privacyHandler(String roomId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, userId)) {
      await _roomRepository.privacyHandler(roomId);
    }
    throw Exception('Invalid access');
  }

  // members collection
  Future<void> removeMember(String roomId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, userId)) {
      return _roomRepository.removeMember(roomId, userId);
    }
    throw Exception('You are not a teacher');
  }

  Future<void> changeRole(
      String userId, String roomId, UserRole newRole) async {
    if (await _roomRepository.isTeacher(roomId, userId)) {
      return _roomRepository.changeRole(userId, roomId, newRole);
    }
    throw Exception('You are not a teacher');
  }

  // invites collection
  Future<void> sendInvite(
      String roomId, String teacherId, String userMail) async {
    if (!await _roomRepository.isTeacher(roomId, teacherId)) {
      throw Exception('Only teachers are allowed to invite');
    }

    UserEntity user = await _userRepository.getUser(userMail);
    UserPresence status = await _roomRepository.getUserPresence(roomId, user.userId);

    if (status.isMember || status.isInvited || status.isBlocked) {
      throw Exception(
          'Please check if user is already invited or a member or blocked');
    } else if (status.isRequested) {
      await _roomRepository.addMember(roomId, user.userId);
      status = await _roomRepository.getUserPresence(roomId, user.userId);
      if (status.isMember) {
        return await _roomRepository.removeRequest(roomId, user.userId);
      }
    }

    return await _roomRepository.sendInvite(roomId, userMail);
  }

  Future<void> removeInvite(
      String roomId, String teacherId, String userMail) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      return _roomRepository.removeInvite(roomId, userMail);
    }
  }

  // requests collection
  Future<void> addRequest(String roomId, String userId) async {
    UserPresence status = await _roomRepository.getUserPresence(roomId, userId);
    if (status.isMember || status.isBlocked || status.isRequested) {
      throw Exception(
          'Error sending request please contact room teacher for more information');
    } else if (status.isInvited) {
      await _roomRepository.addMember(roomId, userId);
      status = await _roomRepository.getUserPresence(roomId, userId);
      if (status.isMember) {
        return await _roomRepository.removeInvite(roomId, userId);
      }
    }
    return _roomRepository.addRequest(roomId, userId);
  }

  Future<void> approveRequest(
      String roomId, String teacherId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      _roomRepository.removeRequest(roomId, userId);
      return _roomRepository.approveRequest(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeRequest(
      String roomId, String teacherId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      return _roomRepository.removeRequest(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> addToBlockList(
      String roomId, String teacherId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      _roomRepository.removeMember(roomId, userId);
      return _roomRepository.addToBlockList(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeFromBlockList(
      String roomId, String teacherId, String userId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      return _roomRepository.removeFromBlockList(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  // bookList collection
  Future<void> addToBookList(
      String roomId, String teacherId, String bookId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      return _roomRepository.addToBookList(roomId, bookId);
    }
  }

  Future<void> removeFromBookList(
      String roomId, String teacherId, String bookId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId)) {
      return _roomRepository.removeFromBookList(roomId, bookId);
    }
  }

  // room collection
  Future<void> createRoom(String roomId, String roomName, String creatorId,
      Map<String, UserRole> members) async {
    UserEntity user = await _userRepository.getUser(creatorId);
    String userId = user.userId;

    if (userId == creatorId) {
      return _roomRepository.createRoom(roomId, roomName, creatorId);
    }
  }

  Future<bool> validateRemoveRoom(String roomId, String teacherId) async {
    // also check if members only have 1 member as teacher
    return _roomRepository.validateRemoveRoom(roomId, teacherId);
  }

  Future<void> removeRoom(String roomId, String teacherId) async {
    if (await _roomRepository.isTeacher(roomId, teacherId) &&
        await _roomRepository.validateRemoveRoom(roomId, teacherId)) {
      return _roomRepository.removeRoom(roomId);
    }
  }

  Future<RoomEntity> getRoom(String roomId) async {
    return _roomRepository.getRoom(roomId);
  }
}
