class HomeWorkEntity {
  final String studentId;
  final String roomId;
  final String bookId;
  final String chapterId;
  Map<int, bool> sectionRange;
  final DateTime creationDate;
  String? reviewerId;
  bool isReviewed;
  DateTime? reviewedDate;

  HomeWorkEntity(
      {required this.studentId,
      required this.roomId,
      required this.bookId,
      required this.chapterId,
      this.sectionRange = const {},
      required this.creationDate,
      this.reviewerId,
      this.isReviewed = false,
      this.reviewedDate});
}
