class UserProgressEntity {
  final String userId;
  final String bookId;
  final String title;
  final String author;
  double bookProgress;

  UserProgressEntity({
    required this.userId,
    required this.bookId,
    required this.title,
    required this.author,
    this.bookProgress = 0.0,
  });
}
