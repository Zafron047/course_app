class HomeWorkEntity {
  final String homeWorkId;
  final String studentId;
  final String roomId;
  final String bookId;
  final String chapterId;
  final List sectionRange;
  final String? teacherId;
  final DateTime creationDate;
  final DateTime? reviewedDate;

  HomeWorkEntity({
      required this.homeWorkId,
      required this.studentId,
      required this.roomId,
      required this.bookId,
      required this.chapterId,
      required this.sectionRange,
      this.teacherId,
      required this.creationDate,
      this.reviewedDate});
}
