class ChapterEntity {
  final String chapterId;
  final String chapterName;
  final String bookId;
  final Map<int, bool> sections;

  ChapterEntity({
    required this.chapterId,
    required this.chapterName,
    required this.bookId,
    this.sections = const {},
  });
}
