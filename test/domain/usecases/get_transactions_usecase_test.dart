import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/domain/repositories/transaction_repository.dart';
import 'package:n26/domain/usecases/get_transactions_usecase.dart';

import '../../mocks/transaction_entity_mock.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  late GetTransactionsUsecase usecase;
  late TransactionRepository repository;

  setUp(() {
    repository = MockTransactionRepository();
    usecase = GetTransactionsUsecase(repository);
  });

  test('should get a list of transaction entity for a given client from the repository', () async {
    when(() => repository.getTransactions(any())).thenAnswer(
      (_) async => Right(tListTransactionEntity),
    );

    final result = await usecase('123');

    expect(result, equals(Right(tListTransactionEntity)));
    verify(() => repository.getTransactions('123')).called(1);
  });

  test("should return a HttpError when don't succeed", () async {
    when(() => repository.getTransactions(any())).thenAnswer(
      (_) async => const Left(HttpError('Something went wrong. Try again later.')),
    );

    final result = await usecase('123');

    expect(result, const Left(HttpError('Something went wrong. Try again later.')));
    verify(() => repository.getTransactions('123')).called(1);
  });
}
