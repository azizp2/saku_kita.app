import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../controllers/report_controller.dart';

class ExpenseCategoryChart extends StatelessWidget {
  final List<ExpenseCategoryModel> categories;
  final String Function(double) formatCurrency;

  const ExpenseCategoryChart({
    super.key,
    required this.categories,
    required this.formatCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 92,
          height: 92,
          child: CustomPaint(painter: _DonutPainter(categories: categories)),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            children: categories
                .map(
                  (category) => Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: category.color,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 6),

                        Expanded(
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 28,
                          child: Text(
                            '${category.percentage}%',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        SizedBox(
                          width: 68,
                          child: Text(
                            formatCurrency(category.amount),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _DonutPainter extends CustomPainter {
  final List<ExpenseCategoryModel> categories;

  _DonutPainter({required this.categories});

  @override
  void paint(Canvas canvas, Size size) {
    if (categories.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);

    final radius = math.min(size.width, size.height) / 2;

    final strokeWidth = 14.0;

    final total = categories.fold<double>(0, (sum, item) => sum + item.amount);

    double startAngle = -math.pi / 2;

    for (final category in categories) {
      final sweepAngle = (category.amount / total) * math.pi * 2;

      final paint = Paint()
        ..color = category.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle - 0.025,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }

    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - strokeWidth - 2, centerPaint);
  }

  @override
  bool shouldRepaint(covariant _DonutPainter oldDelegate) {
    return oldDelegate.categories != categories;
  }
}
