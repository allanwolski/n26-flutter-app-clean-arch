import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:n26/presentation/controllers/home_controller.dart';

class ActionsPage extends GetView<HomeController> {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Actions',
          key: Key('app_bar_title'),
        ),
      ),
      body: const Center(
        child: Text('Actions'),
      ),
    );
  }
}
