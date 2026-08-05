import 'package:flutter/material.dart';
import '../../../model/Search/search_result_model.dart';

class SearchService extends ChangeNotifier {
  String _selectedCategory = 'Popular';
  String _searchQuery = '';
  Map<String, List<SearchResultModel>> _results = {};
  bool _isLoading = false;
  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  bool get isLoading => _isLoading;

  SearchService() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    _initializeData();
  }

  // nTangle - Initialize mock data for all categories
  void _initializeData() {
    _results = {
      'Popular': [
        SearchResultModel(
          id: '1',
          symbol: 'AAPL',
          name: 'Apple Inc.',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/apple.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
        SearchResultModel(
          id: '2',
          symbol: 'TSLA',
          name: 'Tesla Inc.',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/tesla.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
        SearchResultModel(
          id: '3',
          symbol: 'NVDA',
          name: 'NVIDIA Corporation',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/nvidia.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
      ],
      'Stocks': [
        SearchResultModel(
          id: '4',
          symbol: 'AAPL',
          name: 'Apple Inc.',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/apple.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
        SearchResultModel(
          id: '5',
          symbol: 'MSFT',
          name: 'Microsoft Corporation',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/microsoft.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
      ],
      'Indices': [
        SearchResultModel(
          id: '6',
          symbol: 'NIFTY',
          name: 'NIFTY 50',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/nifty.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
      ],
      'Futures': [
        SearchResultModel(
          id: '7',
          symbol: 'GOLD',
          name: 'Gold Futures',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/gold.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
      ],
      'Options': [
        SearchResultModel(
          id: '8',
          symbol: 'NIFTY',
          name: 'NIFTY Options',
          price: '\$577.87',
          percentageChange: '+3.76%',
          pointsChange: '+4.89 pts',
          imageUrl: 'lib/Resources/Images/nifty.png',
          bid: 'B',
          bidPrice: '1130.04',
          ask: 'A',
          askPrice: '1125.08',
        ),
      ],
    };
  }

  // nTangle - Get results for selected category with search filtering
  List<SearchResultModel> getResults() {
    List<SearchResultModel> categoryResults = _results[_selectedCategory] ?? [];

    // If search is empty, return all results for this category
    if (_searchQuery.trim().isEmpty) {
      return categoryResults;
    }

    // Filter by search query (symbol or name)
    final query = _searchQuery.toLowerCase().trim();
    return categoryResults.where((result) {
      return result.symbol.toLowerCase().contains(query) ||
          result.name.toLowerCase().contains(query);
    }).toList();
  }

  // nTangle - Change selected category
  void selectCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  // nTangle - Update search query
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // nTangle - Toggle favorite status for a result
  void toggleFavorite(String resultId) {
    for (var results in _results.values) {
      for (var result in results) {
        if (result.id == resultId) {
          result.isFavorite = !result.isFavorite;
        }
      }
    }
    notifyListeners();
  }

  // nTangle - Simulate search with loading state
  Future<void> performSearch(String query) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _searchQuery = query;
    _isLoading = false;
    notifyListeners();
  }

  // nTangle - Open focus on search field when search icon is clicked
  void openSearchFocus() {
    searchFocusNode.requestFocus();
  }

  // nTangle - Clear search text and unfocus
  void clearSearch() {
    searchController.clear();
    _searchQuery = '';
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
