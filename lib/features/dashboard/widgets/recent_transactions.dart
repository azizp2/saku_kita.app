import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Transaksi Terbaru',
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

        const SizedBox(height: 16),

        const _TransactionItem(
          icon: Icons.restaurant_rounded,
          iconColor: Color(0xFFF3A62F),
          title: 'Makan siang',
          date: 'Hari ini, 12:30',
          amount: '-Rp 45.000',
          amountColor: Color(0xFFE95454),
        ),

        const SizedBox(height: 12),

        const _TransactionItem(
          icon: Icons.account_balance_wallet_rounded,
          iconColor: Color(0xFF2BA67D),
          title: 'Gaji Bulanan',
          date: 'Kemarin, 20:15',
          amount: '+Rp 8.000.000',
          amountColor: Color(0xFF20A77E),
        ),

        const SizedBox(height: 12),

        const _TransactionItem(
          icon: Icons.shopping_bag_rounded,
          iconColor: Color(0xFFE67E50),
          title: 'Belanja Bulanan',
          date: 'Kemarin, 18:30',
          amount: '-Rp 350.000',
          amountColor: Color(0xFFE95454),
        ),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String date;
  final String amount;
  final Color amountColor;

  const _TransactionItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 21),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
              ),
            ],
          ),
        ),

        Text(
          amount,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: amountColor,
          ),
        ),
      ],
    );
  }
}
