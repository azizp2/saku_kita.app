import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? description;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subTitle,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),

        SizedBox(height: 8),

        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: AppColors.muted),
        ),

        if (description != null) ...[
          SizedBox(height: 8),

          Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.muted,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ],
    );
  }
}
