class UserProgressEntity {
  final String userId;
  final String bookId;
  double bookProgress;
  final String title;
  final String author;

  UserProgressEntity({
    required this.userId,
    required this.bookId,
    this.bookProgress = 0.0,
    required this.title,
    required this.author,
  });
}
