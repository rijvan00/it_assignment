String formatNumber(int number) {
  if (number >= 10000000) {
    // Format for Crores
    return '${(number / 10000000).toStringAsFixed(1)}Cr';
  } else if (number >= 1000000) {
    // Format for Lakhs
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else if (number >= 100000) {
    // Format for Lakhs
    return '${(number / 100000).toStringAsFixed(1)}L';
  } else if (number >= 1000) {
    // Format for Thousands
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else {
    // If it's less than 1000, show the number as it is
    return number.toString();
  }
}
