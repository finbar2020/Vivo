import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivo_challange/core/theme/app_colors.dart';
import 'package:vivo_challange/features/search/presentation/controller/custom_search_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomSearchController customSearchController =
        Provider.of<CustomSearchController>(context);
    final filteredHistory = customSearchController.searchHistory
        .where((searchItem) => searchItem.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historico de Pesquisa'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.secundary],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.secundary],
          ),
        ),
        child: ListView.builder(
          itemCount: filteredHistory.length,
          itemBuilder: (context, index) {
            final searchItem = filteredHistory[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                elevation: 2,
                child: ListTile(
                  title: Text(
                    searchItem,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    await customSearchController.searchUser(searchItem);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
