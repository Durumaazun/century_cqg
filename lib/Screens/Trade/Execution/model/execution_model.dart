import 'package:flutter/material.dart';

class ExecutionItem {
  final String dateLabel;
  final String symbol;
  final String orderId;
  final String orderTime;
  final String side;
  final String units;
  final String amount;
  final String profit;
  final String iconText;
  final Color iconColor;

  const ExecutionItem({
    required this.dateLabel,
    required this.symbol,
    required this.orderId,
    required this.orderTime,
    required this.side,
    required this.units,
    required this.amount,
    required this.profit,
    required this.iconText,
    required this.iconColor,
  });
}
