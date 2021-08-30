import 'package:get/get.dart';
import 'package:n26/domain/entities/transaction_entity.dart';
import 'package:n26/domain/helpers/loading_status.dart';
import 'package:n26/domain/usecases/get_transactions_usecase.dart';

class HomeController extends GetxController {
  final _loadingStatus = LoadingStatus.completed.obs;
  final _transactions = RxList(<TransactionEntity>[]);

  LoadingStatus get loadingStatus => _loadingStatus.value;
  List<TransactionEntity> get transactions => _transactions;

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  void onTransactionClick(TransactionEntity transaction) {
    Get.rawSnackbar(message: transaction.description);
  }

  void onActionClick(String action) {
    Get.rawSnackbar(message: action);
  }

  Future<void> getTransactions({bool showLoading = true, bool showError = true}) async {
    final getTransactions = Get.find<GetTransactionsUsecase>();

    if (showLoading) {
      _loadingStatus.value = LoadingStatus.loading;
    }

    getTransactions('123').then((value) {
      value.fold((l) {
        _loadingStatus.value = LoadingStatus.error;

        if (showError) {
          Get.rawSnackbar(message: l.message);
        }
      }, (r) {
        _loadingStatus.value = LoadingStatus.completed;
        _transactions.value = r;
      });
    });
  }
}
