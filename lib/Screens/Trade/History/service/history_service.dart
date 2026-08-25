import 'package:flutter/material.dart';

import 'package:century_cqg/Screens/Trade/History/model/history_model.dart';

class HistoryService extends ChangeNotifier {
  int _selectedTabIndex = 1;

  final List<HistoryItem> _history = const [
    HistoryItem(
      dateLabel: 'Today',
      symbol: 'AAPL',
      orderId: '#54548592',
      orderTime: '12:34 GST',
      side: 'Sell',
      status: 'Close',
      units: '200',
      price: '140158.00',
      stopLoss: '140158.00',
      takeProfit: '172632.00',
      iconText: 'A',
      iconColor: Color(0xFF111111),
    ),
    HistoryItem(
      dateLabel: '28 May',
      symbol: 'TSLA',
      orderId: '#54548592',
      orderTime: '12:26 GST',
      side: 'Sell',
      status: 'Close',
      units: '200',
      price: '140158.00',
      stopLoss: '140158.00',
      takeProfit: '172632.00',
      iconText: 'T',
      iconColor: Color(0xFFE82127),
    ),
    HistoryItem(
      dateLabel: '28 May',
      symbol: 'NVDA',
      orderId: '#54548592',
      orderTime: '11:52 GST',
      side: 'Sell',
      status: 'Close',
      units: '200',
      price: '140158.00',
      stopLoss: '140158.00',
      takeProfit: '172632.00',
      iconText: 'N',
      iconColor: Color(0xFF6BAF2A),
    ),
  ];

  List<HistoryItem> get history => List.unmodifiable(_history);
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int index) {
    if (_selectedTabIndex == index) {
      return;
    }
    _selectedTabIndex = index;
    notifyListeners();
  }
}
