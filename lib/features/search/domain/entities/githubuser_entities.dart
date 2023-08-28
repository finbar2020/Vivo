// ignore_for_file: file_names

class GitHubUserEntity {
  final String login;
  final int id;
  final String avatarUrl;


  GitHubUserEntity({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory GitHubUserEntity.fromJson(Map<String, dynamic> json) {
    return GitHubUserEntity(
      login: json['login'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
    );
  }
}