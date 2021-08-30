import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/domain/helpers/loading_status.dart';
import 'package:n26/domain/usecases/get_transactions_usecase.dart';
import 'package:n26/presentation/controllers/home_controller.dart';

import '../../mocks/transaction_entity_mock.dart';

class MockGetTransactionsUsecase extends Mock implements GetTransactionsUsecase {}

void main() {
  late HomeController controller;
  late GetTransactionsUsecase mockUsecase;

  setUp(() {
    controller = HomeController();
    mockUsecase = MockGetTransactionsUsecase();
    Get.put<GetTransactionsUsecase>(mockUsecase);
  });

  tearDown(() {
    Get.reset();
  });

  test('should return a TransactionEntity from the usecase', () async {
    when(() => mockUsecase(any())).thenAnswer((_) async => Right(tListTransactionEntity));

    await controller.getTransactions(showError: false);

    expect(controller.transactions, tListTransactionEntity);
    expect(controller.loadingStatus, LoadingStatus.completed);
  });

  test('should return a LoadingStatus.error from the usecase when there is an error', () async {
    when(() => mockUsecase(any())).thenAnswer((_) async => const Left(ServerError('Something went wrong. Try again later.')));

    await controller.getTransactions(showError: false);
    expect(controller.loadingStatus, LoadingStatus.error);
  });
}
