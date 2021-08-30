import 'package:flutter/material.dart';
import 'package:n26/domain/helpers/app_page.dart';
import 'package:n26/presentation/pages/pages.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final AppPage currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _child(context),
    );
  }

  Widget _child(BuildContext context) {
    switch (currentPage) {
      case AppPage.home:
        return const HomePage();
      case AppPage.spaces:
        return const SpacesPage();
      case AppPage.explore:
        return const ExplorePage();
      case AppPage.actions:
        return const ActionsPage();
      default:
        return Container();
    }
  }
}
