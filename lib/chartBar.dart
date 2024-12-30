import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendTotalAmount;

  ChartBar(
      {required this.label,
      required this.spendAmount,
      required this.spendTotalAmount});

  @override
  Widget build(BuildContext context) {

   return LayoutBuilder(builder: (ctx, constrains) {
          return Column(
      children: [
        Container(
          height: constrains.maxHeight * 0.15,
          child: FittedBox(child: Text('${spendAmount}')),
          ),
        SizedBox(
          height: constrains.maxHeight * 0.05,
        ),
        Container(
          height: constrains.maxHeight * 0.5,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  color: Color.fromARGB(230, 250, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendTotalAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: constrains.maxHeight * 0.05,
        ),
        Container(
          height: constrains.maxHeight * 0.15,
          child: Text('$label'),
          ),
      ],
    );
    });
  }
}
