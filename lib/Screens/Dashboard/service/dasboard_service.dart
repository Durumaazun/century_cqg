import 'package:flutter/material.dart';
import 'package:century_cqg/Screens/Dashboard/model/dashboard_models.dart';
import 'package:century_cqg/Screens/Dashboard/model/stocks_detail_model.dart';
import 'package:century_cqg/Screens/Dashboard/model/top_view_stocks.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class DashboardService extends ChangeNotifier {
  late AccountSummary _accountSummary;
  late List<Stock> _watchedStocks;
  late List<Position> _topPositions;

  DashboardService() {
    _initializeData();
  }

  void setDarkMode(bool value) {
    if (NerveBase().isDarkMode == value) return;
    NerveBase().isDarkMode = value;
    notifyListeners();
  }

  void toggleDarkMode() {
    setDarkMode(!NerveBase().isDarkMode);
  }

  AccountSummary get accountSummary => _accountSummary;
  List<Stock> get watchedStocks => _watchedStocks;
  List<Position> get topPositions => _topPositions;

  void _initializeData() {
    _accountSummary = AccountSummary(
      cashBalance: '\$84,250.00',
      buyingPower: '\$168,500',
      buyingPowerUnrealized: 'Unrealized P&L',
      buyingPowerUnrealizedValue: '+\$1,842',
      marginUsed: '\$42,100',
      marginUsedRealized: 'Realized P&L',
      marginUsedRealizedValue: '+\$3,215',
    );

    _watchedStocks = [
      Stock(
        symbol: 'AAPL',
        logo: '🍎',
        price: '\$577.87',
        change: '+3.76%',
        changePoints: '+4.89 pts',
        minPrice: '1130.04',
        maxPrice: '1125.08',
      ),
      Stock(
        symbol: 'TSLA',
        logo: '🚙',
        price: '\$577.87',
        change: '+3.76%',
        changePoints: '+4.89 pts',
        minPrice: '1130.04',
        maxPrice: '1125.08',
      ),
      Stock(
        symbol: 'NVDA',
        logo: '⚙️',
        price: '\$577.87',
        change: '+3.76%',
        changePoints: '+4.89 pts',
        minPrice: '1130.04',
        maxPrice: '1125.08',
      ),
    ];

    _topPositions = [
      Position(
        symbol: 'AAPL',
        type: 'BUY',
        quantity: 100,
        avgPrice: '\$00,000.00',
        value: '\$3,000.00',
        ltp: '0,000.00',
      ),
      Position(
        symbol: 'TSLA',
        type: 'BUY',
        quantity: 100,
        avgPrice: '\$00,000.00',
        value: '\$3,000.00',
        ltp: '0,000.00',
      ),
      Position(
        symbol: 'NVDA',
        type: 'BUY',
        quantity: 100,
        avgPrice: '\$00,000.00',
        value: '\$3,000.00',
        ltp: '0,000.00',
      ),
    ];
  }

  void updateAccountSummary(AccountSummary summary) {
    _accountSummary = summary;
    notifyListeners();
  }

  void updateWatchedStocks(List<Stock> stocks) {
    _watchedStocks = stocks;
    notifyListeners();
  }

  void updateTopPositions(List<Position> positions) {
    _topPositions = positions;
    notifyListeners();
  }

  void refreshDashboard() {
    _initializeData();
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

  final List<StockItem> stocks = [
    StockItem(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      iconUrl: '',
      price: 577.87,
      percentageChange: 3.76,
      pointsChange: 4.89,
      bid: 1130.04,
      ask: 1125.08,
      sparklinePoints: const [
        Offset(0.0, 0.5),
        Offset(0.2, 0.6),
        Offset(0.4, 0.3),
        Offset(0.6, 0.7),
        Offset(0.8, 0.4),
        Offset(1.0, 0.5),
      ],
    ),
    StockItem(
      symbol: 'TSLA',
      name: 'Tesla Motors',
      iconUrl: '',
      price: 577.87,
      percentageChange: 3.76,
      pointsChange: 4.89,
      bid: 1130.04,
      ask: 1125.08,
      sparklinePoints: const [
        Offset(0.0, 0.5),
        Offset(0.2, 0.6),
        Offset(0.4, 0.3),
        Offset(0.6, 0.7),
        Offset(0.8, 0.4),
        Offset(1.0, 0.5),
      ],
    ),
    StockItem(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      iconUrl: '',
      price: 577.87,
      percentageChange: 3.76,
      pointsChange: 4.89,
      bid: 1130.04,
      ask: 1125.08,
      sparklinePoints: const [
        Offset(0.0, 0.5),
        Offset(0.2, 0.6),
        Offset(0.4, 0.3),
        Offset(0.6, 0.7),
        Offset(0.8, 0.4),
        Offset(1.0, 0.5),
      ],
    ),
    StockItem(
      symbol: 'TSLA',
      name: 'Tesla Motors',
      iconUrl: '',
      price: 577.87,
      percentageChange: 3.76,
      pointsChange: 4.89,
      bid: 1130.04,
      ask: 1125.08,
      sparklinePoints: const [
        Offset(0.0, 0.5),
        Offset(0.2, 0.6),
        Offset(0.4, 0.3),
        Offset(0.6, 0.7),
        Offset(0.8, 0.4),
        Offset(1.0, 0.5),
      ],
    ),
  ];

  // Call it in build():
  // child: StockHorizontalList(stocks: dummyStocks)
}
