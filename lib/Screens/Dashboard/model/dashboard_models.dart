class AccountSummary {
  final String cashBalance;
  final String buyingPower;
  final String buyingPowerUnrealized;
  final String buyingPowerUnrealizedValue;
  final String marginUsed;
  final String marginUsedRealized;
  final String marginUsedRealizedValue;

  AccountSummary({
    required this.cashBalance,
    required this.buyingPower,
    required this.buyingPowerUnrealized,
    required this.buyingPowerUnrealizedValue,
    required this.marginUsed,
    required this.marginUsedRealized,
    required this.marginUsedRealizedValue,
  });
}

class Stock {
  final String symbol;
  final String logo;
  final String price;
  final String change;
  final String changePoints;
  final String minPrice;
  final String maxPrice;

  Stock({
    required this.symbol,
    required this.logo,
    required this.price,
    required this.change,
    required this.changePoints,
    required this.minPrice,
    required this.maxPrice,
  });
}

class Position {
  final String symbol;
  final String type;
  final int quantity;
  final String avgPrice;
  final String value;
  final String ltp;

  Position({
    required this.symbol,
    required this.type,
    required this.quantity,
    required this.avgPrice,
    required this.value,
    required this.ltp,
  });
}
