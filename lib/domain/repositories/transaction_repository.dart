import 'package:dartz/dartz.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getTransactions(String clientId);
}
