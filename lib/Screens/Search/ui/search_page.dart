import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import '../service/search_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Consumer<SearchService>(
            builder: (context, proValue, _) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 16,
                  bottom: 8,
                  left: 0,
                ),
                child: SizedBox(
                  height: 32,
                  child: TextField(
                    controller: proValue.searchController,
                    focusNode: proValue.searchFocusNode,
                    cursorColor: NerveColors.selectedNavColor,
                    cursorWidth: 2,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: NerveColors.searchTextfieldBorderColor,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: NerveColors.searchTextfieldBorderColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: NerveColors.selectedNavColor,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(16, 4, 12, 4),
                      suffixIcon: Consumer<SearchService>(
                        builder: (context, searchService, _) {
                          return IconButton(
                            icon: Icon(
                              searchService.searchController.text.isEmpty
                                  ? Icons.search
                                  : Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (searchService.searchController.text.isEmpty) {
                                proValue.openSearchFocus();
                              } else {
                                proValue.clearSearch();
                              }
                            },
                          );
                        },
                      ),
                    ),
                    onChanged: (value) {
                      proValue.setSearchQuery(value);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        body: Consumer<SearchService>(
          builder: (context, searchService, _) {
            final results = searchService.getResults();
            final searchQuery = searchService.searchQuery;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          ['Popular', 'Stocks', 'Indices', 'Futures', 'Options']
                              .map(
                                (category) => Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: GestureDetector(
                                    onTap: () {
                                      searchService.selectCategory(category);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            searchService.selectedCategory ==
                                                    category
                                                ? NerveColors.selectedNavColor
                                                : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          color:
                                              searchService.selectedCategory ==
                                                      category
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),

                Expanded(
                  child:
                      results.isEmpty
                          ? Center(
                            child: Text(
                              searchQuery.isEmpty
                                  ? 'No items available'
                                  : 'No results found for "$searchQuery"',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          )
                          : ListView.builder(
                            itemCount: results.length,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            itemBuilder: (context, index) {
                              final result = results[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              result.symbol[0],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                result.symbol,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                result.price,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                NerveColors.chartbgGreenLigth,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                            'lib/Resources/Images/line_chart.svg',
                                            width: 74,
                                            height: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Wrap(
                                          children: [
                                            Text(
                                              result.percentageChange,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF27B67A),
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              result.pointsChange,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF27B67A),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'B ${result.bidPrice}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              'A ${result.askPrice}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            IconButton(
                                              icon: Icon(
                                                result.isFavorite
                                                    ? Icons.bookmark
                                                    : Icons.bookmark_border,
                                                color:
                                                    result.isFavorite
                                                        ? NerveColors
                                                            .selectedNavColor
                                                        : Colors.grey,
                                              ),
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(
                                                minWidth: 24,
                                              ),
                                              onPressed: () {
                                                searchService.toggleFavorite(
                                                  result.id,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
