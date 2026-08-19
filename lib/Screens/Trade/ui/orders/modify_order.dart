import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/service/modify_order_service.dart';
import 'package:century_cqg/Screens/Trade/ui/orders/order_pending_page.dart';

class ModifyOrderPage extends StatelessWidget {
  const ModifyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ModifyOrderService>();
    final isDarkMode = NerveBase().isDarkMode;
    final bgColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final cardColor = isDarkMode ? const Color(0xFF161B19) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF2D3431) : const Color(0xFFE5E9E7);
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF4A4F53);
    final mutedColor =
        isDarkMode ? const Color(0xFF8A918D) : const Color(0xFF8B9198);
    final positiveColor = const Color(0xFF00C389);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cardColor,
        surfaceTintColor: bgColor,
        leading: IconButton(
          icon: Icon(Icons.close, color: titleColor),
          tooltip: 'Cancel order',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(
          'MODIFY ORDER',
          style: NerveStyles.tradeDetailsSectionTitleStyle(titleColor),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buySellToggle(borderColor, service),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFF111111),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'A',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AAPL',
                              style: NerveStyles.tradePositionSymbolStyle(
                                titleColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '\$577.87',
                                  style:
                                      NerveStyles.tradeDetailsSectionTitleStyle(
                                        titleColor,
                                      ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '+3.76%',
                                  style: NerveStyles.tradeDetailsOrderPnlStyle(
                                    positiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _marketLine(
                              'B',
                              '550.04',
                              'A',
                              '625.08',
                              mutedColor,
                            ),
                            const SizedBox(height: 4),
                            _marketLine(
                              'L',
                              '540.81',
                              'H',
                              '640.02',
                              mutedColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _unitsField(
                            borderColor,
                            titleColor,
                            mutedColor,
                            service,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _amountField(
                            borderColor,
                            titleColor,
                            mutedColor,
                            service,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Order Type',
                      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _orderTypeButton(
                            'Market',
                            borderColor,
                            titleColor,
                            service,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _orderTypeButton(
                            'Limit',
                            borderColor,
                            titleColor,
                            service,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _orderTypeButton(
                            'Stop Entry',
                            borderColor,
                            titleColor,
                            service,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Stop Entry',
                      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: service.stopEntryController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              decoration: BoxDecoration(
                color: cardColor,
                border: Border(top: BorderSide(color: borderColor)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                        side: BorderSide(color: borderColor),
                        foregroundColor: titleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Cancel order',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showOrderPendingBottomSheet(context, service);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                        backgroundColor: const Color(0xFFF2C400),
                        foregroundColor: const Color(0xFF1F1F1F),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buySellToggle(Color borderColor, ModifyOrderService service) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                service.setBuy(true);
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      service.isBuy
                          ? const Color(0xFFF2C400)
                          : Colors.transparent,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text('Buy'),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                service.setBuy(false);
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      !service.isBuy
                          ? const Color(0xFFF2C400)
                          : Colors.transparent,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text('Sell'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _marketLine(
    String l1,
    String v1,
    String l2,
    String v2,
    Color mutedColor,
  ) {
    return Text(
      '$l1 $v1   $l2 $v2',
      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
    );
  }

  Widget _unitsField(
    Color borderColor,
    Color titleColor,
    Color mutedColor,
    ModifyOrderService service,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Units',
          style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
        ),
        const SizedBox(height: 6),
        Container(
          height: 38,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              _pmButton('-', borderColor, () {
                service.decrementUnits();
              }),
              Expanded(
                child: Center(
                  child: Text(
                    service.units.toString(),
                    style: NerveStyles.tradeDetailsHeaderSymbolStyle(
                      titleColor,
                    ),
                  ),
                ),
              ),
              _pmButton('+', borderColor, () {
                service.incrementUnits();
              }),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Max: 250',
          style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
        ),
      ],
    );
  }

  Widget _pmButton(String text, Color borderColor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            right:
                text == '-' ? BorderSide(color: borderColor) : BorderSide.none,
            left:
                text == '+' ? BorderSide(color: borderColor) : BorderSide.none,
          ),
        ),
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }

  Widget _amountField(
    Color borderColor,
    Color titleColor,
    Color mutedColor,
    ModifyOrderService service,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount (USD)',
          style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: service.amountController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            prefixText: '\$ ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Avail: 27,416.57',
          style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
        ),
      ],
    );
  }

  Widget _orderTypeButton(
    String type,
    Color borderColor,
    Color titleColor,
    ModifyOrderService service,
  ) {
    final selected = service.selectedOrderType == type;
    return OutlinedButton(
      onPressed: () {
        service.setOrderType(type);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(36),
        side: BorderSide(
          color: selected ? const Color(0xFFF2C400) : borderColor,
        ),
        foregroundColor: selected ? const Color(0xFFB38D00) : titleColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(type),
    );
  }

  void _showOrderPendingBottomSheet(
    BuildContext context,
    ModifyOrderService service,
  ) {
    final amountText = service.amountController.text.trim();
    final stopLossText = service.stopEntryController.text.trim();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return OrderPendingPage(
          symbol: 'AAPL',
          units: service.units.toString(),
          amount: amountText.isEmpty ? '\$164.68' : '\$$amountText',
          orderType: service.selectedOrderType,
          gtcDate: '07/06/2026',
          stopLoss: stopLossText.isEmpty ? '\$163.3' : '\$$stopLossText',
          orderId: '#84060356',
          orderSide: service.isBuy ? 'Buy' : 'Sell',
        );
      },
    );
  }
}
