import 'package:course_app/src/features/feature_name/domain/entities/user/user_role_entity.dart';

class RoomEntity {
  final String roomId;
  final String roomName;
  bool isPrivate;
  bool exists; // Whether the room exists or is active
  final Map<String, UserRole> members; // Members of the room with their roles
  final Map<String, String> requests; // userId and userMail of requesters
  final List<String> invites; // userMails of invited users
  final Map<String, String> blockList; // userId and userMail
  final Map<String, String> bookList; // List of books with bookId and bookName

  RoomEntity({
    required this.roomId,
    required this.roomName,
    this.isPrivate = false, // Default to false
    this.exists = true, // Default to true
    this.members = const {}, // members collection
    this.requests = const {}, // requests collection
    this.invites = const [], // invites collection
    this.blockList = const {}, // blockList collection
    this.bookList = const {}, // bookList collection
  });
}
