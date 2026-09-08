class CurrencyFormatter {
  // 💰 Format Currency ke Rupiah (Default)
  static String format(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');
    return 'Rp $formatted';
  }

  // 💰 Format Currency tanpa simbol Rp
  static String formatNumber(double value) {
    return value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');
  }

  // 💰 Format Currency dengan simbol kustom
  static String formatWithSymbol({
    required double value,
    String symbol = 'Rp ',
    bool showDecimal = false,
  }) {
    String formatted;
    if (showDecimal) {
      formatted = value
          .toStringAsFixed(2)
          .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');
    } else {
      formatted = value
          .toStringAsFixed(0)
          .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');
    }
    return '$symbol$formatted';
  }

  // 💰 Format Currency compact (RB, JT, M)
  static String formatCompact(double value) {
    if (value >= 1000000000) {
      return 'Rp ${(value / 1000000000).toStringAsFixed(1)}M';
    } else if (value >= 1000000) {
      return 'Rp ${(value / 1000000).toStringAsFixed(1)}JT';
    } else if (value >= 1000) {
      return 'Rp ${(value / 1000).toStringAsFixed(1)}RB';
    } else {
      return 'Rp ${value.toStringAsFixed(0)}';
    }
  }

  // 💰 Parse string ke double (untuk input form)
  static double parse(String value) {
    return double.tryParse(value.replaceAll('.', '')) ?? 0;
  }
}
