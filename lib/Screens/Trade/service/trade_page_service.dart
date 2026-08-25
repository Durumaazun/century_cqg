import 'package:flutter/material.dart';

class TradePagePositionItem {
  final String symbol;
  final String avgPrice;
  final String side;
  final String netUnits;
  final String averageAmount;
  final String netPnL;
  final String badge;
  final Color badgeColor;

  const TradePagePositionItem({
    required this.symbol,
    required this.avgPrice,
    required this.side,
    required this.netUnits,
    required this.averageAmount,
    required this.netPnL,
    required this.badge,
    required this.badgeColor,
  });
}

class TradePageService extends ChangeNotifier {
  int _selectedTabIndex = 0;

  final List<String> _tabs = const [
    'Positions',
    'Orders',
    'Holdings',
    'History',
  ];

  final List<TradePagePositionItem> _positions = [
    const TradePagePositionItem(
      symbol: 'AAPL',
      avgPrice: '\$577.87',
      side: 'Buy',
      netUnits: '20,000',
      averageAmount: '66,000.66',
      netPnL: '+13,000.40',
      badge: 'A',
      badgeColor: Color(0xFF8E8E93),
    ),
    const TradePagePositionItem(
      symbol: 'VDA',
      avgPrice: '\$577.87',
      side: 'Buy',
      netUnits: '20,000',
      averageAmount: '66,000.66',
      netPnL: '+13,000.40',
      badge: 'V',
      badgeColor: Color(0xFF4E2B2B),
    ),
    const TradePagePositionItem(
      symbol: 'TSLA',
      avgPrice: '\$577.87',
      side: 'Buy',
      netUnits: '20,000',
      averageAmount: '66,000.66',
      netPnL: '+13,000.40',
      badge: 'T',
      badgeColor: Color(0xFFE82127),
    ),
  ];

  int get selectedTabIndex => _selectedTabIndex;
  List<String> get tabs => _tabs;
  List<TradePagePositionItem> get positions => List.unmodifiable(_positions);

  void setSelectedTabIndex(int index) {
    if (_selectedTabIndex == index) {
      return;
    }
    _selectedTabIndex = index;
    notifyListeners();
  }

  void removePositionAt(int index) {
    if (index < 0 || index >= _positions.length) {
      return;
    }
    _positions.removeAt(index);
    notifyListeners();
  }
}
