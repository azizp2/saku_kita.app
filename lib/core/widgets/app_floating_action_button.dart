import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double iconSize;
  final Color? backgroundColor;
  final Color iconColor;
  final double elevation;

  const AppFloatingActionButton({
    super.key,
    this.onPressed,
    this.icon = Icons.add,
    this.iconSize = 30,
    this.backgroundColor,
    this.iconColor = Colors.white,
    this.elevation = 4,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ?? _defaultOnPressed,
      backgroundColor: backgroundColor ?? AppColors.primary,
      elevation: elevation,
      shape: const CircleBorder(),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }

  void _defaultOnPressed() => Get.toNamed(AppRoutes.addTransaction);
}
