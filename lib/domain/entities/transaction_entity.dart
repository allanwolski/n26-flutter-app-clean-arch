import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  const TransactionEntity({
    required this.id,
    required this.date,
    required this.description,
    required this.amount,
  });

  final String id;
  final DateTime date;
  final String description;
  final double amount;

  @override
  List<Object?> get props => [
        id,
        date,
        description,
        amount,
      ];
}
