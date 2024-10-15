import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart'; // Ensure this imports the model.dart file

Future<List<Article>> fetchArticles() async {
  final response = await http.get(Uri.parse('https://blog-api.automatex.dev/blog'));
  final List<dynamic> jsonData = json.decode(response.body)['data'];

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((article) => Article.fromJson(article)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse('https://blog-api.automatex.dev/categories'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((category) => Category.fromJson(category)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
