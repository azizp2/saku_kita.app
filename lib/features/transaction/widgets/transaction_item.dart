import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String category;
  final String amount;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isIncome;
  final VoidCallback? onTap;

  const TransactionItem({
    super.key,
    required this.title,
    required this.category,
    required this.amount,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isIncome,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, size: 19, color: iconColor),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF374151),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 8,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: isIncome
                        ? const Color(0xFF20A77E)
                        : const Color(0xFFE95454),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  time,
                  style: const TextStyle(fontSize: 8, color: Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
