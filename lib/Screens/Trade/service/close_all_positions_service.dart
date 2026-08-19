import 'package:flutter/material.dart';

class ClosePositionEntry {
  final String orderId;
  final String side;
  final String units;
  final String pnl;
  final bool selected;

  const ClosePositionEntry({
    required this.orderId,
    required this.side,
    required this.units,
    required this.pnl,
    required this.selected,
  });

  ClosePositionEntry copyWith({
    String? orderId,
    String? side,
    String? units,
    String? pnl,
    bool? selected,
  }) {
    return ClosePositionEntry(
      orderId: orderId ?? this.orderId,
      side: side ?? this.side,
      units: units ?? this.units,
      pnl: pnl ?? this.pnl,
      selected: selected ?? this.selected,
    );
  }
}

class CloseAllPositionsService extends ChangeNotifier {
  final List<ClosePositionEntry> _entries;

  CloseAllPositionsService({List<ClosePositionEntry>? initialEntries})
    : _entries =
          initialEntries ??
          const [
            ClosePositionEntry(
              orderId: '#54548592',
              side: 'Buy',
              units: '2',
              pnl: '+\$130.00',
              selected: true,
            ),
            ClosePositionEntry(
              orderId: '#54548592',
              side: 'Buy',
              units: '2',
              pnl: '+\$130.00',
              selected: true,
            ),
            ClosePositionEntry(
              orderId: '#54548592',
              side: 'Buy',
              units: '2',
              pnl: '+\$130.00',
              selected: true,
            ),
            ClosePositionEntry(
              orderId: '#54548592',
              side: 'Buy',
              units: '2',
              pnl: '+\$130.00',
              selected: true,
            ),
          ];

  List<ClosePositionEntry> get entries => List.unmodifiable(_entries);

  int get selectedCount => _entries.where((entry) => entry.selected).length;

  void toggleSelection(int index) {
    if (index < 0 || index >= _entries.length) {
      return;
    }
    final current = _entries[index];
    _entries[index] = current.copyWith(selected: !current.selected);
    notifyListeners();
  }
}
