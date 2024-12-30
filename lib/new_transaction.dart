import './adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _pickedDate;

  void submittData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0 || _pickedDate == null) return;

    widget.addTx(inputTitle, inputAmount, _pickedDate);
    Navigator.of(context).pop();
  }

  void _startAddDate() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _pickedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                controller: titleController,
                onSubmitted: (_) => submittData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountController,
                onSubmitted: (_) => submittData(),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_pickedDate == null
                        ? 'No date choosen!'
                        : 'pickedDate: ${DateFormat.yMd().format(_pickedDate as DateTime)}'),
                  ),
                 AdaptiveFlatButton('choose Date', _startAddDate),
                ],
              ),
              ElevatedButton(
                onPressed: submittData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
