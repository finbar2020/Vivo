import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/search/presentation/controller/custom_search_controller.dart'; // Verifique o caminho correto para o controller
import 'features/search/presentation/pages/search_page.dart';
import 'features/search/presentation/pages/history_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomSearchController>(
          create: (context) => CustomSearchController(),
        ),
      ],
      child: MaterialApp(
        title: 'GitHub Search App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SearchPage(),
          '/history': (context) => const HistoryPage(),
        },
      ),
    );
  }
}
