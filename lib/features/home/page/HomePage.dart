import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/home/controller/home_controller.dart';

class Homepage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home")));
  }
}
