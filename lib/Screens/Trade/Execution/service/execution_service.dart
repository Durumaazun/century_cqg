import 'package:flutter/material.dart';

import 'package:century_cqg/Screens/Trade/Execution/model/execution_model.dart';

class ExecutionService extends ChangeNotifier {
  final List<ExecutionItem> _executions = const [
    ExecutionItem(
      dateLabel: 'Today',
      symbol: 'AAPL',
      orderId: '#54548592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'A',
      iconColor: Color(0xFF111111),
    ),
    ExecutionItem(
      dateLabel: 'Today',
      symbol: 'TSLA',
      orderId: '#54548592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'T',
      iconColor: Color(0xFFE82127),
    ),
    ExecutionItem(
      dateLabel: 'Yesterday',
      symbol: 'NVDA',
      orderId: '#54548592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'N',
      iconColor: Color(0xFF6BAF2A),
    ),
    ExecutionItem(
      dateLabel: '28 May',
      symbol: 'AAPL',
      orderId: '#54548592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'A',
      iconColor: Color(0xFF111111),
    ),
  ];

  List<ExecutionItem> get executions => List.unmodifiable(_executions);
}
