class HomeWorkEntity {
  final String homeWorkId;
  final String studentId;
  final String roomId;
  final String bookId;
  final String chapterId;
  final int sectionStart;
  final int sectionEnd;
  final Map<String, int> sectionRange;
  final DateTime creationDate;
  final String? teacherId;
  final bool isReviewed;
  final DateTime? reviewedDate;

  HomeWorkEntity(
      {required this.homeWorkId,
      required this.studentId,
      required this.roomId,
      required this.bookId,
      required this.chapterId,
      required this.sectionStart,
      required this.sectionEnd,
      this.sectionRange = const {},
      this.teacherId,
      this.isReviewed = false,
      required this.creationDate,
      this.reviewedDate});
}
