extension StringExtension on String {
  String get capitalizeFirstLetter {
    if (length < 2) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
