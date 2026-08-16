import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/transaction/controllers/add_transaction_controller.dart';

class QuickTransaction extends GetView<AddTransactionController> {
  const QuickTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.quickTransactions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final transaction = controller.quickTransactions[index];

          return GestureDetector(
            onTap: () {
              controller.selectQuickTransaction(transaction);
            },
            child: SizedBox(
              width: 58,
              child: Column(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: transaction['color'].withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      transaction['icon'],
                      size: 21,
                      color: transaction['color'],
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    transaction['title'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
