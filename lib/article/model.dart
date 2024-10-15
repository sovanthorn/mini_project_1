class Article {
  final String id;
  final String title;
  final String content;
  final String thumbnail;
  final Author author; // Changed to include Author model
  final int numberOfLikes;
  final int numberOfBookmarks;
  final DateTime createdAt;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.thumbnail,
    required this.author,
    required this.numberOfLikes,
    required this.numberOfBookmarks,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      thumbnail: json['thumbnail'],
      author: Author.fromJson(json['author']),
      numberOfLikes: json['number_of_likes'],
      numberOfBookmarks: json['number_of_bookmarks'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
class Author {
  final String id;
  final String username;
  final String email;
  final String profileUrl;
  final String bio;

  Author({
    required this.id,
    required this.username,
    required this.email,
    required this.profileUrl,
    required this.bio,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profileUrl: json['profileUrl'],
      bio: json['bio'],
    );
  }
}
class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
