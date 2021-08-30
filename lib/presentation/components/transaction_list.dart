import 'package:flutter/material.dart';
import 'package:n26/domain/entities/transaction_entity.dart';
import 'package:n26/presentation/components/transaction_list_tile.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.title,
    required this.items,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<TransactionEntity> items;
  final Function(TransactionEntity item) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 15.0),
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) {
              return const Divider(height: 0.0);
            },
            itemBuilder: (context, index) {
              return TransactionListTile(
                transaction: items[index],
                onPressed: onPressed,
              );
            },
          ),
        ),
      ],
    );
  }
}
