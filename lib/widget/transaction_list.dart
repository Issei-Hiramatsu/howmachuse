import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text(
                  'no transaction added yet',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png'),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                        leading: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(transactions[index].date.toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        )),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
