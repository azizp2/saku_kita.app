import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/constants/category_icons.dart';
import 'package:saku_kita_app/core/widgets/app_input.dart';
import 'package:saku_kita_app/features/transaction/widgets/form/transaction_input.dart';
import '../controllers/category_controller.dart';

class CategoryFormBottomSheet extends StatelessWidget {
  const CategoryFormBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c =
        Get.find<CategoryController>(); // ambil instance yg sama dari binding

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
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
                const Text(
                  'Tambah Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                AppInput(
                  label: 'Category Name',
                  hintText: 'Masukkan category',
                  controller: c.nameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,

                  // errorText: 'category tidak boleh kosong.',
                ),
                const SizedBox(height: 8),
                Text(
                  'Category Type',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                Obx(
                  () => SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'expense',
                        label: Text('Expense'),
                        icon: Icon(Icons.arrow_upward, color: Colors.red),
                      ),
                      ButtonSegment(
                        value: 'income',
                        label: Text('Income'),
                        icon: Icon(Icons.arrow_downward, color: Colors.green),
                      ),
                    ],
                    selected: {c.selectedType.value},
                    onSelectionChanged: (Set<String> newSelection) {
                      c.setType(newSelection.first);
                    },
                    style: SegmentedButton.styleFrom(
                      selectedBackgroundColor: c.selectedType.value == 'expense'
                          ? Colors.red.withOpacity(0.15)
                          : Colors.green.withOpacity(0.15),
                      selectedForegroundColor: c.selectedType.value == 'expense'
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text('Color', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Obx(
                  () => Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: c.colorPalette.map((color) {
                      final isSelected = c.selectedColor.value == color;
                      return GestureDetector(
                        onTap: () => c.setColor(color),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: color.withOpacity(0.5),
                                      blurRadius: 8,
                                    ),
                                  ]
                                : null,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 12),
                Text('Icon', style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                Obx(() {
                  final selectedIconKey = c.selectedIcon.value;
                  final activeColor =
                      c.selectedColor.value ?? Theme.of(context).primaryColor;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: CategoryIcons.icons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final entry = CategoryIcons.icons.entries.elementAt(
                        index,
                      );
                      final key = entry.key;
                      final iconData = entry.value;
                      final isSelected = selectedIconKey == key;

                      return Tooltip(
                        message: key,
                        child: GestureDetector(
                          onTap: () => c.setIcon(key),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? activeColor.withOpacity(0.15)
                                  : Colors.grey[100],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? activeColor
                                    : Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              iconData,
                              color: isSelected
                                  ? activeColor
                                  : Colors.grey[600],
                              size: 22,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),

                const SizedBox(height: 20),

                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: c.isSubmitting.value ? null : c.submitCategory,
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
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
