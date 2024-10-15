import 'package:flutter/material.dart';
import '../article/model.dart'; // Ensure this imports the model.dart file
import '../article/api_service.dart'; // Ensure this imports the api_service.dart file
import 'blog_card.dart'; // Ensure this imports the blog_card.dart file

class BlogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: fetchArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles?.length ?? 0,
            itemBuilder: (context, index) {
              return BlogCard(article: articles![index], onTap: () {
              },);
            },
          );
        } else {
          return const Center(child: Text('No articles found'));
        }
      },
    );
  }
}
