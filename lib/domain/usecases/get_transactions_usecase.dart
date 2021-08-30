import 'package:dartz/dartz.dart';
import 'package:n26/core/errors/exceptions.dart';
import 'package:n26/core/usecase/usecase.dart';
import 'package:n26/domain/entities/transaction_entity.dart';
import 'package:n26/domain/repositories/transaction_repository.dart';

class GetTransactionsUsecase implements Usecase<List<TransactionEntity>, String> {
  GetTransactionsUsecase(this._repository);

  final TransactionRepository _repository;

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(String clientId) async {
    return _repository.getTransactions(clientId);
  }
}
