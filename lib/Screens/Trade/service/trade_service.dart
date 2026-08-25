import 'package:flutter/material.dart';
import 'package:century_cqg/Screens/Trade/model/trade_models.dart';

class TradeService extends ChangeNotifier {
  TradeSummary _summary = const TradeSummary(
    totalPnL: '+\$1,245.00',
    openPositions: '04',
    todaysOrders: '12',
  );

  TradeSummary get summary => _summary;

  void updateSummary(TradeSummary summary) {
    _summary = summary;
    notifyListeners();
  }
}
