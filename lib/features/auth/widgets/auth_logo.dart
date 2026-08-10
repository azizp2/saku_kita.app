import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  final String imagePath;
  const AuthLogo({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Center(
            child: Image.asset(
              imagePath,
              width: 410,
              height: 475,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // const SizedBox(height: 12),

        // const Text(
        //   'Saku.Kita',
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.w800,
        //     color: AppColors.text,
        //   ),
        // ),
      ],
    );
  }
}
