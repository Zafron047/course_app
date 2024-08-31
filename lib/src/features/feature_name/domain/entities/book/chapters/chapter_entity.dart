class ChapterEntity {
  final int chapterNo;
  final String chapterName;
  final Map<int, bool> sections; // Map of sectionNo to bool isMemorized
  double chapterProgress; // Changed with each update to sections

  ChapterEntity({
    required this.chapterNo,
    required this.chapterName,
    this.sections = const {},
    this.chapterProgress = 0.0,
  });
}

// Chapters is now a subcollection of books so we removed the bookId field.
// We also removed the sections field and replaced it with a map of sectionNo to bool isMemorized.