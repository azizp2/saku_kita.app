import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/account_controller.dart';
import '../widgets/account_menu_item.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),

              const SizedBox(height: 14),

              _AccountHeader(controller: controller),

              const SizedBox(height: 14),

              _MenuSection(controller: controller),

              const SizedBox(height: 10),

              _LogoutButton(onTap: controller.logout),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Akun',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.text,
      ),
    );
  }
}

class _AccountHeader extends StatelessWidget {
  final AccountController controller;

  const _AccountHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 30,
                        color: Color(0xFF6B7280),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.userName,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      controller.joinedDate,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton(
              onPressed: controller.editAccount,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2EA883),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Kelola Akun',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final AccountController controller;

  const _MenuSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: controller.menuItems.map((item) {
          return AccountMenuItem(
            title: item['title'] as String,
            icon: item['icon'] as IconData,
            onTap: () {
              controller.onMenuTap(item['title'] as String);
            },
          );
        }).toList(),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Row(
            children: [
              Icon(Icons.logout_rounded, size: 19, color: Color(0xFFE25555)),

              SizedBox(width: 12),

              Text(
                'Keluar',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFE25555),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
