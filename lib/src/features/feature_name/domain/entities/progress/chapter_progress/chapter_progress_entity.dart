class ChapterProgressEntity {
  final String chapterName;
  int ttlSections;
  double chapterProgress;
  Map<int, bool> sections; // Map of sectionNo to bool isMemorized

  ChapterProgressEntity({
    required this.chapterName,
    this.ttlSections = 0,
    this.chapterProgress = 0.0,
    this.sections = const {},
  });
}
