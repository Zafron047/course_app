class SectionEntity {
  final int sectionId;
  final bool memorized;
  final String chapterId;

  SectionEntity({
    required this.sectionId,
    this.memorized = false,
    required this.chapterId,
  });
}