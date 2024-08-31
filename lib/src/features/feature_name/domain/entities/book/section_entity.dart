class SectionEntity {
  final String chapterId;
  final int sectionId;
  final bool memorized;

  SectionEntity({
    required this.chapterId,
    required this.sectionId,
    this.memorized = false,
  });
}
