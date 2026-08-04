class WatchlistItem {
  final String symbol;
  final String companyName;
  final double price;
  final double changePercent;

  const WatchlistItem({
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.changePercent,
  });
}
