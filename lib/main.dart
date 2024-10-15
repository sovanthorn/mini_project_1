import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/screens/login_screen.dart';
import 'dart:convert';
import 'package:mini_project/screens/sign_in_screen.dart';
import 'package:mini_project/widget/blog_card.dart';
import 'package:mini_project/widget/blog_details.dart';
import '../article/model.dart';
import 'package:mini_project/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Article> articles = [];
  List<Article> filteredArticles = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final response = await http.get(Uri.parse('https://blog-api.automatex.dev/blogs')); // Ensure the correct endpoint is used.
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> blogs = jsonData['blogs']; // Access the 'blogs' key
      articles = blogs.map((article) => Article.fromJson(article)).toList();
      filteredArticles = articles;
      setState(() {});
    } else {
      throw Exception('Failed to load articles');
    }
  }

  void filterArticles(String query) {
    final filtered = articles.where((article) {
      return article.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      searchQuery = query;
      filteredArticles = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Image.asset(
            "assets/image/daily.png",
            height: 20,
            width: 20,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Choose an option'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text('Sign Up'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search articles...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: filterArticles,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredArticles.length,
              itemBuilder: (context, index) {
                final article = filteredArticles[index];
                return BlogCard(
                  article: article,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailsPage(article: article),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
