import 'dart:ui';

import 'package:flutter/material.dart';

final List<Color> colorPalette = [
  const Color(0xFFEF4444), // red
  const Color(0xFFF97316), // orange
  const Color(0xFFF59E0B), // amber
  const Color(0xFFEAB308), // yellow
  const Color(0xFF84CC16), // lime
  const Color(0xFF22C55E), // green
  const Color(0xFF14B8A6), // teal
  const Color(0xFF06B6D4), // cyan
  const Color(0xFF3B82F6), // blue
  const Color(0xFF6366F1), // indigo
  const Color(0xFF8B5CF6), // violet
  const Color(0xFFEC4899), // pink
  const Color(0xFFF43F5E), // rose
  const Color(0xFF64748B), // slate
];

Color hexToColor(String? hex, {Color fallback = Colors.grey}) {
  if (hex == null || hex.isEmpty) return fallback;
  var value = hex.replaceAll("#", "");
  if (value.length == 6) value = "FF$value";
  try {
    return Color(int.parse(value, radix: 16));
  } catch (_) {
    return fallback;
  }
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
}
