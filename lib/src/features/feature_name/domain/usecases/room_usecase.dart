// import 'package:course_app/src/features/feature_name/domain/entities/room.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_presence.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_role.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room_repository.dart';

class RoomUsecase {
  final RoomRepository repository;

  RoomUsecase(this.repository);

  // redundant helper method
  Future<UserPresence> getUserPresence(String roomId, String userField) async {
    User user = await repository.getUserDetails(userField);
    String userId = user.userId;
    String userMail = user.email;

    return UserPresence(
      isMember: await repository.isMember(roomId, userId),
      isInvited: await repository.isInvited(roomId, userMail),
      isRequested: await repository.requested(roomId, userId),
      isBlocked: await repository.isBlocked(roomId, userId),
    );
  }

  Future<void> setRoomName(
      String roomId, String userId, String newRroomName) async {
    if (await repository.isTeacher(roomId, userId)) {
      await repository.setRoomName(roomId, newRroomName);
    }
    throw Exception('Invalid access');
  }

  Future<void> privacyHandler(String roomId, String userId) async {
    if (await repository.isTeacher(roomId, userId)) {
      await repository.privacyHandler(roomId);
    }
    throw Exception('Invalid access');
  }

  // members collection
  Future<void> removeMember(String roomId, String userId) async {
    if (await repository.isTeacher(roomId, userId)) {
      return repository.removeMember(roomId, userId);
    }
    throw Exception('You are not a teacher');
  }

  Future<void> changeRole(
      String userId, String roomId, UserRole newRole) async {
    if (await repository.isTeacher(roomId, userId)) {
      return repository.changeRole(userId, roomId, newRole);
    }
    throw Exception('You are not a teacher');
  }

  // invites collection
  Future<void> sendInvite(
      String roomId, String teacherId, String userMail) async {
    if (!await repository.isTeacher(roomId, teacherId)) {
      throw Exception('Only teachers are allowed to invite');
    }

    User user = await repository.getUserDetails(userMail);
    UserPresence status = await repository.getUserPresence(roomId, user.userId);

    if (status.isMember || status.isInvited || status.isBlocked) {
      throw Exception(
          'Please check if user is already invited or a member or blocked');
    } else if (status.isRequested) {
      await repository.addMember(roomId, user.userId);
      status = await repository.getUserPresence(roomId, user.userId);
      if (status.isMember) {
        return await repository.removeRequest(roomId, user.userId);
      }
    }

    return await repository.sendInvite(roomId, userMail);
  }

  Future<void> removeInvite(
      String roomId, String teacherId, String userMail) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      return repository.removeInvite(roomId, userMail);
    }
  }

  // requests collection
  Future<void> addRequest(String roomId, String userId) async {
    UserPresence status = await repository.getUserPresence(roomId, userId);
    if (status.isMember || status.isBlocked || status.isRequested) {
      throw Exception(
          'Error sending request please contact room teacher for more information');
    } else if (status.isInvited) {
      await repository.addMember(roomId, userId);
      status = await repository.getUserPresence(roomId, userId);
      if (status.isMember) {
        return await repository.removeInvite(roomId, userId);
      }
    }
    return repository.addRequest(roomId, userId);
  }

  Future<void> approveRequest(
      String roomId, String teacherId, String userId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      repository.removeRequest(roomId, userId);
      return repository.approveRequest(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeRequest(
      String roomId, String teacherId, String userId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      return repository.removeRequest(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> addToBlockList(
      String roomId, String teacherId, String userId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      repository.removeMember(roomId, userId);
      return repository.addToBlockList(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeFromBlockList(
      String roomId, String teacherId, String userId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      return repository.removeFromBlockList(roomId, userId);
    }
    throw Exception('Invalid access');
  }

  // bookList collection
  Future<void> addToBookList(
      String roomId, String teacherId, String bookId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      return repository.addToBookList(roomId, bookId);
    }
  }

  Future<void> removeFromBookList(
      String roomId, String teacherId, String bookId) async {
    if (await repository.isTeacher(roomId, teacherId)) {
      return repository.removeFromBookList(roomId, bookId);
    }
  }

  // room collection
  Future<void> createRoom(String roomId, String roomName, String creatorId,
      Map<String, UserRole> members) async {
    User user = await repository.getUserDetails(creatorId);
    String userId = user.userId;

    if (userId == creatorId) {
      return repository.createRoom(roomId, roomName, creatorId);
    }
  }

  Future<void> removeRoom(String roomId, String teacherId) async {
    if (await repository.isTeacher(roomId, teacherId) &&
        await repository.validateRemoveRoom(roomId, teacherId)) {
      return repository.removeRoom(roomId);
    }
  }

  Future<RoomEntity> getRoom(String roomId) async {
    return repository.getRoom(roomId);
  }
}
