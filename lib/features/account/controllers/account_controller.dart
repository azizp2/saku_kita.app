import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  final userName = 'Andi & Siti';
  final joinedDate = 'Bergabung sejak 2024 ❤️';

  final menuItems = const [
    {'title': 'Profil & Pengaturan', 'icon': Icons.person_outline_rounded},
    {'title': 'Anggota & Peran', 'icon': Icons.group_outlined},
    {'title': 'Keamanan', 'icon': Icons.shield_outlined},
    {'title': 'Notifikasi', 'icon': Icons.notifications_none_rounded},
    {'title': 'Bantuan & FAQ', 'icon': Icons.help_outline_rounded},
    {'title': 'Tentang Saku.Kita', 'icon': Icons.info_outline_rounded},
  ];

  void onMenuTap(String title) {
    switch (title) {
      case 'Profil & Pengaturan':
        // TODO: Get.toNamed(AppRoutes.profile);
        break;

      case 'Anggota & Peran':
        // TODO
        break;

      case 'Keamanan':
        // TODO
        break;

      case 'Notifikasi':
        // TODO
        break;

      case 'Bantuan & FAQ':
        // TODO
        break;

      case 'Tentang Saku.Kita':
        // TODO
        break;
    }
  }

  void editAccount() {
    // TODO: buka halaman edit akun
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Keluar'),
        content: const Text('Apakah kamu yakin ingin keluar dari akun?'),
        actions: [
          TextButton(onPressed: Get.back, child: const Text('Batal')),
          TextButton(
            onPressed: () {
              Get.back();

              // TODO:
              // clear token
              // clear session
              // Get.offAllNamed(AppRoutes.login);
            },
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
