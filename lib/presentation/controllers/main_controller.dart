import 'package:get/get.dart';
import 'package:n26/domain/helpers/app_page.dart';

class MainController extends GetxController {
  final _currentPage = AppPage.home.obs;
  final _pageIndex = 0.obs;

  AppPage get currentPage => _currentPage.value;
  int get pageIndex => _pageIndex.value;

  set currentPage(AppPage page) {
    _currentPage.value = page;
    switch (page) {
      case AppPage.home:
        _pageIndex.value = 0;
        break;
      case AppPage.spaces:
        _pageIndex.value = 1;
        break;
      case AppPage.explore:
        _pageIndex.value = 2;
        break;
      case AppPage.actions:
        _pageIndex.value = 3;
        break;
    }
  }

  set pageIndex(int page) {
    _pageIndex.value = page;
    switch (page) {
      case 0:
        _currentPage.value = AppPage.home;
        break;
      case 1:
        _currentPage.value = AppPage.spaces;
        break;
      case 2:
        _currentPage.value = AppPage.explore;
        break;
      case 3:
        _currentPage.value = AppPage.actions;
        break;
    }
  }
}
