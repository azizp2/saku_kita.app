import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';
import 'package:saku_kita_app/core/widgets/app_floating_action_button.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/transaction_header.dart';
import '../widgets/transaction_filter.dart';
import '../widgets/transaction_item.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: TransactionHeader(),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TransactionFilter(),
            ),

            const SizedBox(height: 14),

            Expanded(
              child: Obx(() {
                final transactions = controller.filteredTransactions;

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];

                    final showDate =
                        index == 0 ||
                        transaction['date'] != transactions[index - 1]['date'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDate) ...[
                          if (index != 0) const SizedBox(height: 14),

                          Text(
                            transaction['date'],
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.text,
                            ),
                          ),

                          const SizedBox(height: 8),
                        ],

                        TransactionItem(
                          title: transaction['title'],
                          category: transaction['category'],
                          amount: transaction['amount'],
                          time: transaction['time'],
                          icon: transaction['icon'],
                          iconColor: transaction['color'],
                          isIncome: transaction['isIncome'],
                          onTap: () {
                            controller.openTransaction(transaction);
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
