import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Watchlist/service/watchlist_service.dart';

class CreateWatchlistPage extends StatefulWidget {
  const CreateWatchlistPage({super.key});

  @override
  State<CreateWatchlistPage> createState() => _CreateWatchlistPageState();
}

class _CreateWatchlistPageState extends State<CreateWatchlistPage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _createWatchlist() async {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _errorText = 'Watchlist name is required';
      });
      return;
    }

    final added = await context.read<WatchlistService>().addWatchedList(input);
    if (!mounted) {
      return;
    }

    if (added) {
      Navigator.of(context).pop(input);
      return;
    }

    setState(() {
      _errorText = 'Watchlist already exists';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final scaffoldColor =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF6F6F6);
    final borderColor =
        isDarkMode ? const Color(0xFF343434) : const Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        toolbarHeight: NerveStyles.appBarHeight,
        backgroundColor: NerveStyles.appBarBackground(isDarkMode),
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'CREATE WATCHLIST',
          style: NerveStyles.titleTextStyle(isDarkMode),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Watchlist Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _controller,
                    onSubmitted: (_) => _createWatchlist(),
                    decoration: InputDecoration(
                      hintText: 'Watchlist 3',
                      errorText: _errorText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              isDarkMode
                                  ? const Color(0xFF8B8B8B)
                                  : const Color(0xFFB0B0B0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                    ),
                    onChanged: (_) {
                      if (_errorText != null) {
                        setState(() {
                          _errorText = null;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
            decoration: BoxDecoration(
              color: NerveStyles.appBarBackground(isDarkMode),
              border: Border(top: BorderSide(color: borderColor)),
            ),
            child: ElevatedButton(
              onPressed: _createWatchlist,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC600),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
