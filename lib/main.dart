import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_navigation.dart';
import 'package:century_cqg/Screens/Account/service/account_service.dart';
import 'package:century_cqg/Screens/Dashboard/service/dasboard_service.dart';
import 'package:century_cqg/Screens/Login/service/login_service.dart';
import 'package:century_cqg/Screens/Watchlist/service/watchlist_service.dart';
import 'package:century_cqg/Screens/Search/service/search_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  customClearCache();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardService>(
          create: (_) => DashboardService(),
        ),
        ChangeNotifierProvider<WatchlistService>(
          create: (_) => WatchlistService(),
        ),
        ChangeNotifierProvider<AccountService>(create: (_) => AccountService()),
        ChangeNotifierProvider<SearchService>(create: (_) => SearchService()),
        ChangeNotifierProvider<LoginService>(create: (_) => LoginService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardService>(
      builder: (context, dashboardService, _) {
        final isDarkMode = NerveBase().isDarkMode;

        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFF6F6F6),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: NerveScreensNames.splash,
          routes: NerveNavigator.appRoutes,
          builder:
              (context, child) => MediaQuery(
                data: MediaQueryData.fromView(View.of(context)).copyWith(
                  devicePixelRatio: 1.0,
                  textScaler: TextScaler.linear(1.0),
                ),
                child: SafeArea(
                  child:
                      child ??
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                ),
              ),
        );
      },
    );
  }
}

void customClearCache() {
  NerveBase().clearImageCache();
}
