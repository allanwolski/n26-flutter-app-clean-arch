import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_date/dart_date.dart';
import 'package:n26/domain/helpers/loading_status.dart';
import 'package:n26/presentation/components/components.dart';
import 'package:n26/presentation/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          key: Key('app_bar_title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.list_bullet),
            onPressed: () {},
          ),
          const RotatedBox(
            quarterTurns: 1,
            child: Divider(
              indent: 15.0,
              endIndent: 15.0,
            ),
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.getTransactions(showLoading: false);
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            const Text(
              '2.740,57 €',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const CurrentBalance(
              key: Key('current_balance'),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  key: const Key('add_money'),
                  label: 'Add Money',
                  icon: CupertinoIcons.add,
                  borderColor: const Color(0xFF31ac9b),
                  backgroundColor: const Color(0xFF31ac9b),
                  onPressed: controller.onActionClick,
                ),
                ActionButton(
                  label: 'Send Money',
                  icon: CupertinoIcons.arrow_right,
                  borderColor: const Color(0xFF31ac9b),
                  backgroundColor: const Color(0xFF31ac9b),
                  onPressed: controller.onActionClick,
                ),
                ActionButton(
                  label: 'Scheduled',
                  icon: Icons.calendar_today_outlined,
                  borderColor: const Color(0xFFe9e9e9),
                  backgroundColor: Colors.white,
                  onPressed: controller.onActionClick,
                ),
                ActionButton(
                  label: 'Statistics',
                  icon: Icons.pie_chart_outlined,
                  borderColor: const Color(0xFFe9e9e9),
                  backgroundColor: Colors.white,
                  onPressed: controller.onActionClick,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Obx(() {
              if (controller.loadingStatus == LoadingStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransactionList(
                    title: 'Today',
                    items: controller.transactions.where((e) => e.date.isToday).toList(),
                    onPressed: controller.onTransactionClick,
                  ),
                  const SizedBox(height: 20.0),
                  TransactionList(
                    title: 'Yesterday',
                    items: controller.transactions.where((e) => e.date.isYesterday).toList(),
                    onPressed: controller.onTransactionClick,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
