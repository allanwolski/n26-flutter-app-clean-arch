import 'package:dartz/dartz.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/data/datasources/transaction_data_source.dart';
import 'package:n26/domain/entities/transaction_entity.dart';
import 'package:n26/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._datasource);

  final TransactionDataSource _datasource;

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(String clientId) async {
    try {
      final result = await _datasource.getTransactions(clientId);
      return Right(result);
    } on HttpError {
      return const Left(ServerError('Something went wrong. Try again later.'));
    }
  }
}
