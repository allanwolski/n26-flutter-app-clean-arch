import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/data/datasources/transaction_data_source.dart';

import '../../mocks/transaction_mock.dart';
import '../../mocks/transaction_model_mock.dart';

class MockClient extends Mock implements Client {}

void main() {
  late MockClient client;
  late TransactionDataSourceImpl datasource;

  setUp(() {
    client = MockClient();
    datasource = TransactionDataSourceImpl(client);
    registerFallbackValue<Uri>(Uri());
  });

  test('should return a list of TransactionModel when the call is successful', () async {
    when(() => client.get(any())).thenAnswer((_) async => Response(transactionMock, 200));

    final result = await datasource.getTransactions('123');
    expect(result, tListTransactionModel);
  });

  test('should throw a HttpError when the call is unccessful', () async {
    when(() => client.get(any())).thenAnswer((_) async => Response('Something went wrong. Try again later.', 400));

    final result = datasource.getTransactions('123');
    expect(() => result, throwsA(const HttpError('Something went wrong. Try again later.')));
  });
}
