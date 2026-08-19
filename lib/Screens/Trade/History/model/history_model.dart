import 'package:flutter/material.dart';

class HistoryItem {
  final String dateLabel;
  final String symbol;
  final String orderId;
  final String orderTime;
  final String side;
  final String status;
  final String units;
  final String price;
  final String stopLoss;
  final String takeProfit;
  final String iconText;
  final Color iconColor;

  const HistoryItem({
    required this.dateLabel,
    required this.symbol,
    required this.orderId,
    required this.orderTime,
    required this.side,
    required this.status,
    required this.units,
    required this.price,
    required this.stopLoss,
    required this.takeProfit,
    required this.iconText,
    required this.iconColor,
  });
}
