import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class AccountMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const AccountMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Icon(icon, size: 19, color: const Color(0xFF5F6B75)),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              size: 19,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}
