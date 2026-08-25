import 'package:flutter/material.dart';

class StockItem {
  final String symbol;
  final String name;
  final String iconUrl; // Or use an IconData / local asset path
  final double price;
  final double percentageChange;
  final double pointsChange;
  final double bid;
  final double ask;
  final List<Offset> sparklinePoints;

  const StockItem({
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.price,
    required this.percentageChange,
    required this.pointsChange,
    required this.bid,
    required this.ask,
    required this.sparklinePoints,
  });
}
