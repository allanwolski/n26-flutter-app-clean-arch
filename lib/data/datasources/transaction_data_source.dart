import 'dart:convert';
import 'package:http/http.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/data/models/transaction_model.dart';

abstract class TransactionDataSource {
  Future<List<TransactionModel>> getTransactions(String clientId);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  TransactionDataSourceImpl(this.client);

  final Client client;

  @override
  Future<List<TransactionModel>> getTransactions(String clientId) async {
    final response = await client.get(Uri.parse('https://api.agronew.app/test/transactions/$clientId'));

    if (response.statusCode == 200) {
      final transactions = json.decode(response.body);
      return List<TransactionModel>.from(transactions.map(
        (x) => TransactionModel.fromJson(x),
      ));
    } else {
      throw const HttpError('Something went wrong. Try again later.');
    }
  }
}
