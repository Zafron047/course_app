class UserProgressEntity {
  final String userId;
  final String bookId;
  final String progressId;

  UserProgressEntity({
    required this.userId,
    required this.bookId,
  }) : progressId = '${userId}_$bookId';
}