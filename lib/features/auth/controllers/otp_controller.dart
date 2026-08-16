import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OtpController extends GetxController {
  final otpControllers = List.generate(6, (_) => TextEditingController());
  final otpFocusNodes = List.generate(6, (_) => FocusNode());
}
