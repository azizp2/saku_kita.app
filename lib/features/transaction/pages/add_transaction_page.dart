import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/transaction/widgets/form/quick_transaction.dart';
import 'package:saku_kita_app/features/transaction/widgets/form/transaction_input.dart';
import 'package:saku_kita_app/features/transaction/widgets/form/transaction_type_selector.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/add_transaction_controller.dart';

class AddTransactionPage extends GetView<AddTransactionController> {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),

              const SizedBox(height: 22),

              const TransactionTypeSelector(),

              const SizedBox(height: 24),

              const Text(
                'Jumlah',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),

              const SizedBox(height: 8),

              TransactionInput(
                controller: controller.amountController,
                hintText: 'Rp 0',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.account_balance_wallet_outlined,
              ),

              const SizedBox(height: 16),

              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),

              const SizedBox(height: 8),

              Obx(
                () => TransactionInput(
                  hintText:
                      controller.selectedCategory.value ?? 'Pilih kategori',
                  prefixIcon: Icons.category_outlined,
                  suffixIcon: Icons.chevron_right_rounded,
                  readOnly: true,
                  onTap: controller.selectCategory,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Wallet',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),

              const SizedBox(height: 8),

              Obx(
                () => TransactionInput(
                  hintText: controller.selectedWallet.value ?? 'Pilih wallet',
                  prefixIcon: Icons.account_balance_wallet_outlined,
                  suffixIcon: Icons.chevron_right_rounded,
                  readOnly: true,
                  onTap: controller.selectWallet,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Tanggal',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),

              const SizedBox(height: 8),

              Obx(
                () => TransactionInput(
                  hintText: _formatDate(controller.selectedDate.value),
                  prefixIcon: Icons.calendar_today_outlined,
                  readOnly: true,
                  onTap: controller.selectDate,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Catatan (opsional)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),

              const SizedBox(height: 8),

              TransactionInput(
                controller: controller.noteController,
                hintText: 'Tulis catatan',
                maxLines: 1,
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: controller.saveTransaction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Simpan Transaksi',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Transaksi Rutin',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppColors.text,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // TODO: lihat semua transaksi rutin
                    },
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const QuickTransaction(),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: AppColors.text,
          ),
        ),

        const Expanded(
          child: Text(
            'Tambah Transaksi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
        ),

        const SizedBox(width: 20),
      ],
    );
  }
}
