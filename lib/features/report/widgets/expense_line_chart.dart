import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class ExpenseLineChart extends StatelessWidget {
  final List<double> data;

  const ExpenseLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: CustomPaint(painter: _ExpenseChartPainter(data: data)),
    );
  }
}

class _ExpenseChartPainter extends CustomPainter {
  final List<double> data;

  _ExpenseChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    const left = 32.0;
    const right = 8.0;
    const top = 10.0;
    const bottom = 28.0;

    final chartWidth = size.width - left - right;
    final chartHeight = size.height - top - bottom;

    final maxValue = data.reduce(math.max);

    final gridPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 0.7;

    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.16)
      ..style = PaintingStyle.fill;

    // Grid horizontal.
    for (int i = 0; i <= 3; i++) {
      final y = top + chartHeight * (i / 3);

      canvas.drawLine(
        Offset(left, y),
        Offset(size.width - right, y),
        gridPaint,
      );
    }

    // Grid vertical.
    for (int i = 0; i < 5; i++) {
      final x = left + chartWidth * (i / 4);

      canvas.drawLine(Offset(x, top), Offset(x, top + chartHeight), gridPaint);
    }

    final points = <Offset>[];

    for (int i = 0; i < data.length; i++) {
      final x = data.length == 1
          ? left + chartWidth / 2
          : left + chartWidth * (i / (data.length - 1));

      final normalized = data[i] / maxValue;

      final y = top + chartHeight * (1 - normalized);

      points.add(Offset(x, y));
    }

    final linePath = Path();

    linePath.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      linePath.lineTo(points[i].dx, points[i].dy);
    }

    final fillPath = Path.from(linePath);

    fillPath.lineTo(points.last.dx, top + chartHeight);

    fillPath.lineTo(points.first.dx, top + chartHeight);

    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);

    canvas.drawPath(linePath, linePaint);

    final dotPaint = Paint()..color = AppColors.primary;

    for (final point in points) {
      canvas.drawCircle(point, 2.5, dotPaint);
    }

    _drawText(canvas, '750K', Offset(0, top - 4));

    _drawText(canvas, '500K', Offset(0, top + chartHeight / 3 - 4));

    _drawText(canvas, '250K', Offset(0, top + chartHeight * 2 / 3 - 4));

    _drawText(canvas, '1 Mei', Offset(left - 4, size.height - 15));

    _drawText(
      canvas,
      '8 Mei',
      Offset(left + chartWidth * .25 - 8, size.height - 15),
    );

    _drawText(
      canvas,
      '15 Mei',
      Offset(left + chartWidth * .5 - 12, size.height - 15),
    );

    _drawText(
      canvas,
      '22 Mei',
      Offset(left + chartWidth * .75 - 12, size.height - 15),
    );

    _drawText(
      canvas,
      '31 Mei',
      Offset(left + chartWidth - 26, size.height - 15),
    );
  }

  void _drawText(Canvas canvas, String text, Offset offset) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 7, color: Color(0xFF9CA3AF)),
      ),
      textDirection: TextDirection.ltr,
    );

    painter.layout();

    painter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant _ExpenseChartPainter oldDelegate) {
    return oldDelegate.data != data;
  }
}
