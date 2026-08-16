import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_pages.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';

import 'theme/app_theme.dart';

class SakuKitaApp extends StatelessWidget {
  const SakuKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saku.Kita',
      theme: AppTheme.light,

      initialRoute: AppRoutes.account,
      getPages: AppPages.routes,
      // initialBinding: DashboardBinding(),
    );
  }
}
