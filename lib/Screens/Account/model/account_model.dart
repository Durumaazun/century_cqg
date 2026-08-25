import 'package:flutter/material.dart';

class AccountAllocationItem {
  final String symbol;
  final String name;
  final double changePercent;
  final int allocationPercent;
  final double amountInMillions;
  final Color color;

  const AccountAllocationItem({
    required this.symbol,
    required this.name,
    required this.changePercent,
    required this.allocationPercent,
    required this.amountInMillions,
    required this.color,
  });
}
