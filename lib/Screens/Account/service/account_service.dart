import 'package:flutter/material.dart';
import 'package:century_cqg/Screens/Account/model/account_model.dart';
import 'package:century_cqg/Screens/Dashboard/model/top_view_stocks.dart';

class AccountService extends ChangeNotifier {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    notifyListeners();
  }

  final List<StockPosition> positions = [
    StockPosition(
      ticker: 'AAPL',
      type: 'BUY',
      qty: 1000,
      profit: 3000.00,
      avgPrice: 0.0,
      ltp: 0000.00,
    ),
    StockPosition(
      ticker: 'TSLA',
      type: 'BUY',
      qty: 100,
      profit: 3000.00,
      avgPrice: 00000.0,
      ltp: 0000.0,
    ),
    StockPosition(
      ticker: 'NVDA',
      type: 'BUY',
      qty: 100,
      profit: 3000.00,
      avgPrice: 0.0,
      ltp: 0000.0,
    ),
  ];

  final List<AccountAllocationItem> allocations = const [
    AccountAllocationItem(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      changePercent: 15.41,
      allocationPercent: 42,
      amountInMillions: 28.4,
      color: Color(0xFF35B67A),
    ),
    AccountAllocationItem(
      symbol: 'US100',
      name: 'S&P 100',
      changePercent: -8.20,
      allocationPercent: 33,
      amountInMillions: 15.6,
      color: Color(0xFFF24861),
    ),
    AccountAllocationItem(
      symbol: 'US500',
      name: 'S&P 500',
      changePercent: 12.88,
      allocationPercent: 18,
      amountInMillions: 12.2,
      color: Color(0xFF6B5CF5),
    ),
    AccountAllocationItem(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      changePercent: -2.10,
      allocationPercent: 7,
      amountInMillions: 4.7,
      color: Color(0xFF7B8291),
    ),
  ];

  String get allocationTotalValue => '\$67,700,000';
}
