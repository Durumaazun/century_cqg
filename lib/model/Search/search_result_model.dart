class SearchResultModel {
  final String id;
  final String symbol;
  final String name;
  final String price;
  final String percentageChange;
  final String pointsChange;
  final String imageUrl;
  final String bid;
  final String bidPrice;
  final String ask;
  final String askPrice;
  bool isFavorite;

  SearchResultModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.price,
    required this.percentageChange,
    required this.pointsChange,
    required this.imageUrl,
    required this.bid,
    required this.bidPrice,
    required this.ask,
    required this.askPrice,
    this.isFavorite = false,
  });

  // nTangle - Convert JSON to model
  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json['id'] ?? '',
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      percentageChange: json['percentageChange'] ?? '',
      pointsChange: json['pointsChange'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      bid: json['bid'] ?? '',
      bidPrice: json['bidPrice'] ?? '',
      ask: json['ask'] ?? '',
      askPrice: json['askPrice'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  // nTangle - Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'price': price,
      'percentageChange': percentageChange,
      'pointsChange': pointsChange,
      'imageUrl': imageUrl,
      'bid': bid,
      'bidPrice': bidPrice,
      'ask': ask,
      'askPrice': askPrice,
      'isFavorite': isFavorite,
    };
  }
}
