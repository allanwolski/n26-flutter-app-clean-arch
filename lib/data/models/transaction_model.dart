import 'package:intl/intl.dart';
import 'package:n26/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required id,
    required date,
    required description,
    required amount,
  }) : super(
          id: id,
          date: date,
          description: description,
          amount: amount,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json['id'],
        description: json['description'],
        amount: json['amount'].toDouble(),
        date: DateFormat('yyyy-MM-dd').parse(json['date']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'date': DateFormat('yyyy-MM-dd').format(date),
        'description': description,
        'amount': amount,
      };
}
