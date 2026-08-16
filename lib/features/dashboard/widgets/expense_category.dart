import 'dart:math' as math;

import 'package:flutter/material.dart';

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Kategori Pengeluaran',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),

            Text(
              'Lihat semua',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF20A77E),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Row(
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: CustomPaint(painter: _DonutPainter()),
            ),

            const SizedBox(width: 20),

            const Expanded(
              child: Column(
                children: [
                  _CategoryItem(
                    color: Color(0xFF1685A8),
                    name: 'Makan & Minum',
                    amount: 'Rp 2.000.000',
                    percentage: '33%',
                  ),
                  _CategoryItem(
                    color: Color(0xFFE19B37),
                    name: 'Transportasi',
                    amount: 'Rp 1.300.000',
                    percentage: '21%',
                  ),
                  _CategoryItem(
                    color: Color(0xFFE65C35),
                    name: 'Belanja',
                    amount: 'Rp 1.100.000',
                    percentage: '17%',
                  ),
                  _CategoryItem(
                    color: Color(0xFF7B8794),
                    name: 'Hiburan',
                    amount: 'Rp 940.000',
                    percentage: '15%',
                  ),
                  _CategoryItem(
                    color: Color(0xFFA5ADB5),
                    name: 'Lainnya',
                    amount: 'Rp 960.000',
                    percentage: '15%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Color color;
  final String name;
  final String amount;
  final String percentage;

  const _CategoryItem({
    required this.color,
    required this.name,
    required this.amount,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),

          const SizedBox(width: 7),

          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 10, color: Color(0xFF4B5563)),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Text(
            amount,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
          ),

          const SizedBox(width: 6),

          SizedBox(
            width: 24,
            child: Text(
              percentage,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 9, color: Color(0xFF9CA3AF)),
            ),
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2 - 8;

    const values = [33.0, 21.0, 17.0, 15.0, 14.0];

    const colors = [
      Color(0xFF1685A8),
      Color(0xFFE19B37),
      Color(0xFFE65C35),
      Color(0xFF7B8794),
      Color(0xFFA5ADB5),
    ];

    double startAngle = -math.pi / 2;

    for (int i = 0; i < values.length; i++) {
      final sweepAngle = (values[i] / 100) * math.pi * 2;

      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 13;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }

    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 10, centerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
