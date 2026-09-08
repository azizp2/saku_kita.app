import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_button.dart';
import 'package:saku_kita_app/core/widgets/app_input.dart';
import 'package:saku_kita_app/features/wallets/controllers/wallet_controller.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_response.dart';

class WalletFormBottomSheet extends StatefulWidget {
  const WalletFormBottomSheet({super.key, this.wallet});

  final WalletResponse? wallet;

  @override
  State<WalletFormBottomSheet> createState() => _WalletFormBottomSheetState();
}

class _WalletFormBottomSheetState extends State<WalletFormBottomSheet> {
  late final WalletController c;

  @override
  void initState() {
    super.initState();

    c = Get.find<WalletController>();

    if (widget.wallet != null) {
      c.setEditWallet(widget.wallet!);
    } else {
      c.resetForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.wallet != null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFF9FAFB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Form(
        key: c.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              '${isEdit ? 'Edit' : 'Tambah'} Wallet',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AppInput(
              label: 'Wallet Name',
              hintText: 'Masukkan name',
              controller: c.nameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,

              // errorText: 'category tidak boleh kosong.',
            ),

            const SizedBox(height: 20),

            Obx(
              () => AppButton(
                text: isEdit ? 'Update Wallet' : 'Simpan Wallet',
                loading: c.isLoading.value,
                onPressed: c.submitForm,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
