import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:n26/domain/entities/transaction_entity.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    required this.transaction,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final TransactionEntity transaction;
  final Function(TransactionEntity item) onPressed;

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.currency(locale: 'de_DE', symbol: '€');
    return ListTile(
      title: Text(transaction.description),
      subtitle: Text(DateFormat.MMMMd().format(transaction.date)),
      leading: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundColor: Color((transaction.description.hashCode * 0xFFFFFF).toInt()).withOpacity(1.0),
        child: Text(transaction.description[0]),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: transaction.amount > 0 ? const Color(0xFFe0f1ed) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          format.format(transaction.amount),
          style: TextStyle(
            color: transaction.amount > 0 ? const Color(0xFF266756) : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: () => onPressed(transaction),
    );
  }
}
