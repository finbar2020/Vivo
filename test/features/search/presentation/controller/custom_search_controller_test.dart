import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:vivo_challange/core/mocks/mocks.dart';
import 'package:vivo_challange/features/search/presentation/controller/custom_search_controller.dart';


void main() {
  group('CustomSearchController', () {
    late CustomSearchController controller;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      controller = CustomSearchController();
    });

    test('fetchUserData returns GitHubUserModel on success', () async {
      const responseBody = '{"login": "testUser", "avatar_url": "avatarUrl"}';
      final response = http.Response(responseBody, 200);
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => response);

      controller.setUsername('testUser');
      final result = await controller.fetchUserData();

      expect(result.username, 'testUser');
      expect(result.avatarUrl, 'avatarUrl');
      expect(controller.searchHistory, contains('testUser'));
    });

    test('fetchUserData throws exception on error', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Error', 400));

      controller.setUsername('testUser');
      expect(() => controller.fetchUserData(), throwsException);
    });
  });
}
