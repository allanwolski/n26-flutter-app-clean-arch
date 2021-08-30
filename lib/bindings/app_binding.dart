import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:n26/data/datasources/transaction_data_source.dart';
import 'package:n26/data/repositories/transaction_repository_impl.dart';
import 'package:n26/domain/repositories/transaction_repository.dart';
import 'package:n26/domain/usecases/get_transactions_usecase.dart';
import 'package:n26/presentation/controllers/home_controller.dart';
import 'package:n26/presentation/controllers/main_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client(), fenix: true);
    Get.lazyPut(() => MainController(), fenix: true);

    Get.lazyPut(() {
      Get.put<TransactionDataSource>(TransactionDataSourceImpl(Get.find<Client>()));
      Get.put<TransactionRepository>(TransactionRepositoryImpl(Get.find<TransactionDataSource>()));
      Get.put<GetTransactionsUsecase>(GetTransactionsUsecase(Get.find<TransactionRepository>()));
      return HomeController();
    }, fenix: true);
  }
}
