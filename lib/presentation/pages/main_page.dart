import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:n26/presentation/components/components.dart';
import 'package:n26/presentation/controllers/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageSwitcher(
          currentPage: controller.currentPage,
        ),
        bottomNavigationBar: BottomNavigation(
          currentIndex: controller.pageIndex,
          onTap: (index) => controller.pageIndex = index,
        ),
      ),
    );
  }
}
