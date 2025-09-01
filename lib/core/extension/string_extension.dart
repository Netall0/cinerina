extension StringExtension on String? {
  String orIfEmpty(String alternative) {
    if (this == null || this!.isEmpty) {
      return alternative;
    }
    return this!;
  }
}
