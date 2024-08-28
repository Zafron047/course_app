class HomeWorkEntity {
  final String homeWorkId;
  final String studentId;
  final String roomId;
  final String bookId;
  final String chapterId;
  final int sectionStart;
  final int sectionEnd;
  Map<int, bool> sectionRange;
  final DateTime creationDate;
  String? reviewerId;
  bool isReviewed;
  DateTime? reviewedDate;

  HomeWorkEntity(
      {required this.homeWorkId,
      required this.studentId,
      required this.roomId,
      required this.bookId,
      required this.chapterId,
      required this.sectionStart,
      required this.sectionEnd,
      this.sectionRange = const {},
      required this.creationDate,
      this.reviewerId,
      this.isReviewed = false,
      this.reviewedDate});
}
