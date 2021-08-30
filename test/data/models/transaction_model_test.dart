import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:n26/data/models/transaction_model.dart';
import 'package:n26/domain/entities/transaction_entity.dart';

import '../../mocks/transaction_mock.dart';
import '../../mocks/transaction_model_mock.dart';

void main() {
  test('should be a subclass of TransactionEntity', () {
    expect(tListTransactionModel, isA<List<TransactionEntity>>());
  });

  test('should return a valid model', () {
    final jsonMap = json.decode(transactionMock);
    final result = List<TransactionModel>.from(jsonMap.map(
      (x) => TransactionModel.fromJson(x),
    ));

    expect(result, tListTransactionModel);
  });

  test('should return a json map containing the proper data', () {
    final result = tListTransactionModel.map((e) => e.toJson()).toList();
    expect(result, expectedMap);
  });
}
