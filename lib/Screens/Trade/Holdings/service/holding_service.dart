import 'package:flutter/material.dart';

import 'package:century_cqg/Screens/Trade/Holdings/model/holding_model.dart';

class HoldingService extends ChangeNotifier {
  final List<HoldingItem> _holdings = const [
    HoldingItem(
      symbol: 'AAPL',
      orderId: '#5458592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'A',
      iconColor: Color(0xFF111111),
    ),
    HoldingItem(
      symbol: 'TSLA',
      orderId: '#5458592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'T',
      iconColor: Color(0xFFE82127),
    ),
    HoldingItem(
      symbol: 'NVDA',
      orderId: '#5458592',
      orderTime: '2:56 GST',
      side: 'Buy',
      units: '200',
      amount: '6000',
      profit: '172.00',
      iconText: 'N',
      iconColor: Color(0xFF6BAF2A),
    ),
  ];

  List<HoldingItem> get holdings => List.unmodifiable(_holdings);
}
