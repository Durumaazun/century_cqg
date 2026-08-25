class StockPosition {
  final String ticker;
  final String type; // BUY or SELL
  final int qty;
  final double profit;
  final double avgPrice;
  final double ltp;

  StockPosition({
    required this.ticker,
    required this.type,
    required this.qty,
    required this.profit,
    required this.avgPrice,
    required this.ltp,
  });
}
