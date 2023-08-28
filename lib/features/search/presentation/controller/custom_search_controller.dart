import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vivo_challange/features/search/domain/entities/githubuser_entities.dart';
import 'package:vivo_challange/features/search/infra/models/githubuser_model.dart';

class CustomSearchController extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  String authToken = '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';
  GitHubUserModel gitHubUserModel =
      GitHubUserModel(username: '', avatarUrl: '');

  Set<String> searchHistory = {};

  Future<GitHubUserModel> fetchUserData() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${username.text}'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final entity = GitHubUserEntity.fromJson(json);
      final model = GitHubUserModel(
        username: entity.login,
        avatarUrl: entity.avatarUrl,
      );
      gitHubUserModel = model;
      searchHistory.add(username.text);

      return gitHubUserModel;
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  void setUsername(String value) {
    username.text = value;
    notifyListeners();
  }

  void clearUserData() {
    gitHubUserModel = GitHubUserModel(username: '', avatarUrl: '');
    notifyListeners();
  }

  Future<void> searchUser(String username) async {
    setUsername(username);
    await fetchUserData();
    notifyListeners();
  }
}
