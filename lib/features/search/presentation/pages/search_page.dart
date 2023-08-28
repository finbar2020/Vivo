import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivo_challange/core/theme/app_colors.dart';
import 'package:vivo_challange/features/search/infra/models/githubuser_model.dart';
import 'package:vivo_challange/features/search/presentation/controller/custom_search_controller.dart';
import 'package:vivo_challange/features/search/presentation/pages/history_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool isSearchPressed = false;

  @override
  Widget build(BuildContext context) {
    CustomSearchController customSearchController =
        Provider.of<CustomSearchController>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.secundary],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: customSearchController.username,
                        style: const TextStyle(color: AppColors.neutral),
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          labelStyle: const TextStyle(color: AppColors.neutral),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.neutral,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.neutral,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.neutral,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.neutral,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (customSearchController.username.text.isNotEmpty) {
                        await customSearchController.fetchUserData();

                        setState(() {
                          isSearchPressed = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.neutral,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      elevation: 9.0,
                    ),
                    child: const Text(
                      'Buscar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (customSearchController.username.text.isNotEmpty &&
                      isSearchPressed)
                    Builder(
                      builder: (context) {
                        final snapshot = customSearchController.gitHubUserModel;
                        if (snapshot == null) {
                          return const SizedBox.shrink();
                        }

                        if (snapshot.username.isNotEmpty) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.username),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.avatarUrl),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ElevatedButton(
                    onPressed: () {
                      customSearchController.clearUserData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.neutral,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      elevation: 9.0,
                    ),
                    child: const Text(
                      'Historico',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
