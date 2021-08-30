import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:n26/presentation/controllers/home_controller.dart';

class ExplorePage extends GetView<HomeController> {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          key: Key('app_bar_title'),
        ),
      ),
      body: const Center(
        child: Text('Explore'),
      ),
    );
  }
}
