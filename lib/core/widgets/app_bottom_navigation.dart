import 'package:flutter/material.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Beranda',
            selected: currentIndex == 0,
            onTap: () => onChanged(0),
          ),

          _NavItem(
            icon: Icons.receipt_long_rounded,
            label: 'Transaksi',
            selected: currentIndex == 1,
            onTap: () => onChanged(1),
          ),

          const SizedBox(width: 48),

          _NavItem(
            icon: Icons.pie_chart_outline_rounded,
            label: 'Budget',
            selected: currentIndex == 2,
            onTap: () => onChanged(2),
          ),

          _NavItem(
            icon: Icons.person_outline_rounded,
            label: 'Akun',
            selected: currentIndex == 3,
            onTap: () => onChanged(3),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saku_kita_app/app/routes/app_routes.dart';
// import 'package:saku_kita_app/app/theme/app_colors.dart';

// class AppBottomNavigation extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onChanged;

//   const AppBottomNavigation({super.key, required this.currentIndex, required this.onChanged});

//   void _onItemTapped(int index) {
//     switch (index) {
//       case 0:
//         if (currentIndex != 0) {
//           Get.offNamed(AppRoutes.dashboard);
//         }
//         break;

//       case 1:
//         if (currentIndex != 1) {
//           Get.offNamed(AppRoutes.transaction);
//         }
//         break;

//       case 2:
//         if (currentIndex != 2) {
//           Get.offNamed(AppRoutes.budget);
//         }
//         break;

//       case 3:
//         if (currentIndex != 3) {
//           Get.offNamed(AppRoutes.account);
//         }
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       height: 72,
//       color: Colors.white,
//       elevation: 8,
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _NavItem(
//             icon: Icons.home_rounded,
//             label: 'Beranda',
//             selected: currentIndex == 0,
//             onTap: () => _onItemTapped(0),
//           ),

//           _NavItem(
//             icon: Icons.receipt_long_rounded,
//             label: 'Transaksi',
//             selected: currentIndex == 1,
//             onTap: () => _onItemTapped(1),
//           ),

//           const SizedBox(width: 48),

//           _NavItem(
//             icon: Icons.pie_chart_outline_rounded,
//             label: 'Budget',
//             selected: currentIndex == 2,
//             onTap: () => _onItemTapped(2),
//           ),

//           _NavItem(
//             icon: Icons.person_outline_rounded,
//             label: 'Akun',
//             selected: currentIndex == 3,
//             onTap: () => _onItemTapped(3),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: selected ? AppColors.primary : const Color(0xFF9CA3AF),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? AppColors.primary : const Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
