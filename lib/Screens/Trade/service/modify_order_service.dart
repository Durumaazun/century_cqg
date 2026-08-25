import 'package:flutter/material.dart';

class ModifyOrderService extends ChangeNotifier {
  bool _isBuy = true;
  int _units = 200;
  String _selectedOrderType = 'Stop Entry';

  final TextEditingController amountController = TextEditingController(
    text: '60,000.45',
  );
  final TextEditingController stopEntryController = TextEditingController(
    text: '60,000.45',
  );

  bool get isBuy => _isBuy;
  int get units => _units;
  String get selectedOrderType => _selectedOrderType;

  void setBuy(bool value) {
    if (_isBuy == value) {
      return;
    }
    _isBuy = value;
    notifyListeners();
  }

  void incrementUnits() {
    _units += 1;
    notifyListeners();
  }

  void decrementUnits() {
    if (_units <= 1) {
      return;
    }
    _units -= 1;
    notifyListeners();
  }

  void setOrderType(String type) {
    if (_selectedOrderType == type) {
      return;
    }
    _selectedOrderType = type;
    notifyListeners();
  }

  @override
  void dispose() {
    amountController.dispose();
    stopEntryController.dispose();
    super.dispose();
  }
}
