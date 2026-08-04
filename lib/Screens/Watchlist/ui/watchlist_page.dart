import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Watchlist/model/watchlist_item.dart';
import 'package:century_cqg/Screens/Watchlist/service/watchlist_service.dart';
import 'package:century_cqg/Screens/Watchlist/ui/create_watchlist_page.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  void _showYellowErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFFC600),
      ),
    );
  }

  Future<void> _showAddToWatchlistBottomSheet(
    BuildContext context,
    WatchlistService watchlistService,
  ) async {
    final watchlistNames = List<String>.from(watchlistService.watchedLists);
    final selectedNames = <String>{
      watchlistService.watchedLists[watchlistService.selectedTabIndex],
    };

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        final isDarkMode = NerveBase().isDarkMode;
        final panelColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
        final borderColor =
            isDarkMode ? const Color(0xFF484E4B) : const Color(0xFFD8DDE3);
        final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
        final subtitleColor =
            isDarkMode ? const Color(0xFF8C9390) : const Color(0xFF6D726F);

        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) return;
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: StatefulBuilder(
            builder: (stfContext, setModalState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(stfContext).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 24,
                        bottom: 24,
                      ),
                      decoration: BoxDecoration(
                        color: panelColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Add to Watchlist',
                                  style: NerveStyles.black_medium_16(
                                    isDarkMode,
                                  ).copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed:
                                    () => Navigator.of(sheetContext).pop(),
                                tooltip: 'Cancel',
                                icon: Icon(
                                  Icons.close,
                                  color: titleColor,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Select or create a watchlist where you\'ll like to add this product',
                            style: NerveStyles.grey_medium_14(
                              isDarkMode,
                            ).copyWith(height: 1.3, color: subtitleColor),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 140,
                            child: SingleChildScrollView(
                              child: Column(
                                children:
                                    watchlistNames
                                        .map(
                                          (name) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 24,
                                                  height: 24,
                                                  child: Checkbox(
                                                    value: selectedNames
                                                        .contains(name),
                                                    activeColor: const Color(
                                                      0xFFFFC600,
                                                    ),
                                                    checkColor: Colors.black,
                                                    side: BorderSide(
                                                      color:
                                                          isDarkMode
                                                              ? const Color(
                                                                0xFF7D8481,
                                                              )
                                                              : const Color(
                                                                0xFFB0B7B3,
                                                              ),
                                                    ),
                                                    onChanged: (value) {
                                                      setModalState(() {
                                                        if (value ?? false) {
                                                          selectedNames.add(
                                                            name,
                                                          );
                                                        } else {
                                                          selectedNames.remove(
                                                            name,
                                                          );
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    name,
                                                    style:
                                                        NerveStyles.black_medium_14_500(
                                                          isDarkMode,
                                                        ).copyWith(
                                                          color: titleColor,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () async {
                                    Navigator.of(sheetContext).pop();
                                    final createdName = await Navigator.of(
                                      context,
                                    ).push<String>(
                                      MaterialPageRoute(
                                        builder:
                                            (_) => const CreateWatchlistPage(),
                                      ),
                                    );
                                    if (!context.mounted) {
                                      return;
                                    }
                                    if (createdName != null) {
                                      watchlistService.selectWatchlistByName(
                                        createdName,
                                      );
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: borderColor),
                                    foregroundColor: titleColor,
                                    minimumSize: const Size.fromHeight(44),
                                  ),
                                  child: const Text('Create New'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    for (final name
                                        in watchlistService.watchedLists) {
                                      if (selectedNames.contains(name)) {
                                        watchlistService.selectWatchlistByName(
                                          name,
                                        );
                                        break;
                                      }
                                    }
                                    Navigator.of(sheetContext).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFC600),
                                    foregroundColor: Colors.black,
                                    minimumSize: const Size.fromHeight(44),
                                  ),
                                  child: const Text('Done'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _showRenameBottomSheet(
    BuildContext context,
    WatchlistService watchlistService,
  ) async {
    final currentName =
        watchlistService.watchedLists[watchlistService.selectedTabIndex];
    final controller = TextEditingController(text: currentName);

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        final isDarkMode = NerveBase().isDarkMode;
        final panelColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
        final borderColor =
            isDarkMode ? const Color(0xFF2A2E2C) : const Color(0xFFD8DDE3);

        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) return;
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                decoration: BoxDecoration(
                  color: panelColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white24 : Colors.black12,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Rename Watchlist',
                        style: NerveStyles.black_medium_16(
                          isDarkMode,
                        ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: controller,
                        autofocus: true,
                        onTapOutside:
                            (_) => FocusScope.of(sheetContext).unfocus(),
                        decoration: InputDecoration(
                          hintText: 'Enter Watchlist Name',
                          filled: true,
                          fillColor:
                              isDarkMode
                                  ? Colors.white.withOpacity(0.05)
                                  : Colors.black.withOpacity(0.03),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFFFC600),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(sheetContext).pop(),
                              style: OutlinedButton.styleFrom(
                                foregroundColor:
                                    isDarkMode
                                        ? Colors.white70
                                        : Colors.black54,
                                side: BorderSide(color: borderColor),
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                final renamed = await watchlistService
                                    .renameSelectedWatchlist(controller.text);
                                if (!sheetContext.mounted) {
                                  return;
                                }

                                Navigator.of(sheetContext).pop();
                                if (!renamed) {
                                  _showYellowErrorSnackBar(
                                    context,
                                    'Unable to rename watchlist',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFC600),
                                foregroundColor: Colors.black,
                                minimumSize: const Size.fromHeight(50),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Rename',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _avatarColor(String symbol) {
    switch (symbol.toUpperCase()) {
      case 'AAPL':
        return const Color(0xFF111111);
      case 'NVDA':
        return const Color(0xFF76B900);
      case 'TSLA':
        return const Color(0xFFE82127);
      default:
        return const Color(0xFF4A90E2);
    }
  }

  Future<void> _deleteSelectedWatchlist(
    BuildContext context,
    WatchlistService watchlistService,
  ) async {
    if (watchlistService.watchedLists.length > 1) {
      final watchlistName =
          watchlistService.watchedLists[watchlistService.selectedTabIndex];

      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) {
          final isDarkMode = NerveBase().isDarkMode;
          final panelColor =
              isDarkMode ? const Color(0xFF0D110F) : Colors.white;
          final borderColor =
              isDarkMode ? const Color(0xFF484E4B) : const Color(0xFFD8DDE3);
          final titleColor =
              isDarkMode ? Colors.white : const Color(0xFF2A2A2A);

          return SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: panelColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delete $watchlistName',
                      style: NerveStyles.black_medium_16(
                        isDarkMode,
                      ).copyWith(color: titleColor),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(sheetContext).pop(),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: borderColor),
                              foregroundColor:
                                  isDarkMode
                                      ? const Color(0xFFB6BAB8)
                                      : const Color(0xFF5F6368),
                              minimumSize: const Size.fromHeight(44),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final deleted =
                                  await watchlistService
                                      .deleteSelectedWatchlist();
                              if (!sheetContext.mounted) {
                                return;
                              }

                              Navigator.of(sheetContext).pop();

                              if (!deleted && context.mounted) {
                                _showYellowErrorSnackBar(
                                  context,
                                  'At least one watchlist is required',
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE03A55),
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(44),
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
      return;
    }

    final deleted = await watchlistService.deleteSelectedWatchlist();
    if (!context.mounted) {
      return;
    }

    if (!deleted) {
      _showYellowErrorSnackBar(context, 'At least one watchlist is required');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final watchlistService = context.watch<WatchlistService>();
    final selectedWatchlistName = watchlistService.selectedWatchlistName;
    final List<WatchlistItem> items = watchlistService.getWatchlistItemsFor(
      selectedWatchlistName,
    );

    final backgroundColor =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFFFFFFF);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: isDarkMode ? const Color(0xFF1C211E) : Colors.transparent,
            width: isDarkMode ? 1 : 0,
          ),
          bottom: BorderSide(
            color: isDarkMode ? const Color(0xFF1C211E) : Colors.transparent,
            width: isDarkMode ? 1 : 0,
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        selectedWatchlistName,
                        overflow: TextOverflow.ellipsis,
                        style: NerveStyles.black_medium_16(
                          isDarkMode,
                        ).copyWith(height: 1.0),
                      ),
                    ),
                    const SizedBox(width: 6),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 24),
                      tooltip: 'Edit WatchedList Name',
                      onPressed:
                          () =>
                              _showRenameBottomSheet(context, watchlistService),
                      icon: Icon(
                        Icons.drive_file_rename_outline,
                        size: 18,
                        color:
                            isDarkMode
                                ? const Color(0xFF9AA0A6)
                                : const Color(0xFF5F6368),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 28),
                tooltip: 'Add to Watchlist',
                onPressed:
                    () => _showAddToWatchlistBottomSheet(
                      context,
                      watchlistService,
                    ),
                icon: Icon(
                  Icons.add,
                  size: 22,
                  color:
                      isDarkMode
                          ? const Color(0xFF9AA0A6)
                          : const Color(0xFF5F6368),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 28),
                tooltip: 'Edit Watchlist',
                onPressed:
                    () => _showRenameBottomSheet(context, watchlistService),
                icon: const Icon(
                  Icons.edit_square,
                  size: 18,
                  color: Color(0xFF1E55CF),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 28),
                onPressed:
                    () => _deleteSelectedWatchlist(context, watchlistService),
                icon: const Icon(
                  Icons.delete,
                  size: 18,
                  color: Color(0xFFD32F2F),
                ),
              ),
            ],
          ),
          (items.isEmpty)
              ? Center(
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC600),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 22,
                    onPressed:
                        () => _showAddToWatchlistBottomSheet(
                          context,
                          watchlistService,
                        ),
                    icon: const Icon(Icons.add, color: Colors.black),
                  ),
                ),
              )
              : const SizedBox(height: 10),
          ...items.map((item) {
            final isPositive = item.changePercent >= 0;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: NerveStyles.rowBorderColor(isDarkMode),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: _avatarColor(item.symbol),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            item.symbol.substring(0, 1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.symbol,
                              style: NerveStyles.black_bold_16(isDarkMode),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: NerveStyles.grey_medium_13(isDarkMode),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color:
                              isDarkMode
                                  ? NerveColors.chartbgGreenDark
                                  : NerveColors.chartbgGreenLigth,
                          // ),
                          // color:
                          //     isDarkMode
                          //         ? const Color(0xFF0D110F)
                          //         : const Color(0xFFEAF7F0),
                          borderRadius: BorderRadius.circular(6),
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
                            '${isPositive ? '+' : ''}${item.changePercent.toStringAsFixed(2)}%',
                            style: NerveStyles.green_medium_14(
                              isDarkMode,
                            ).copyWith(color: const Color(0xFF27B67A)),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${(item.price * 0.08).toStringAsFixed(2)} pts)',
                            style: NerveStyles.green_medium_12_400(
                              isDarkMode,
                            ).copyWith(color: const Color(0xFF27B67A)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'B ${(item.price + 552.17).toStringAsFixed(2)}',
                        style: NerveStyles.grey_medium_13(isDarkMode),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'A ${(item.price + 547.21).toStringAsFixed(2)}',
                        style: NerveStyles.grey_medium_13(isDarkMode),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
