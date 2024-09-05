class ChapterEntity {
  final String bookId;
  final int chapterNo;
  final String chapterName;
  final Map<int, bool> sections; // Map of sectionNo to bool isMemorized

  ChapterEntity({
    required this.bookId,
    required this.chapterNo,
    required this.chapterName,
    this.sections = const {},
  });
}

// Chapters is now a subcollection of books so we removed the bookId field.
// We also removed the sections field and replaced it with a map of sectionNo to bool isMemorized.