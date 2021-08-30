import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/data/datasources/transaction_data_source.dart';
import 'package:n26/data/repositories/transaction_repository_impl.dart';

import '../../mocks/transaction_model_mock.dart';

class MockTransactionDataSource extends Mock implements TransactionDataSource {}

void main() {
  late TransactionRepositoryImpl repository;
  late TransactionDataSource datasource;

  setUp(() {
    datasource = MockTransactionDataSource();
    repository = TransactionRepositoryImpl(datasource);
  });

  test('should return a list of transaction model when calls the datasource', () async {
    when(() => datasource.getTransactions(any())).thenAnswer((_) async => tListTransactionModel);

    final result = await repository.getTransactions('123');

    expect(result, Right(tListTransactionModel));
    verify(() => datasource.getTransactions('123')).called(1);
  });

  test('should return a server error when the call to datasource is unsucessful', () async {
    when(() => datasource.getTransactions(any())).thenThrow(const HttpError('Something went wrong. Try again later.'));

    final result = await repository.getTransactions('123');

    expect(result, const Left(ServerError('Something went wrong. Try again later.')));
    verify(() => datasource.getTransactions('123')).called(1);
  });
}
