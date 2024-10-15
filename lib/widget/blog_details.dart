import 'package:flutter/material.dart';
import '../article/model.dart'; // Ensure this imports the Article model

class BlogDetailsPage extends StatelessWidget {
  final Article article;

  const BlogDetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display article thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.thumbnail,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Display article title
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              // Display author information
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(article.author.profileUrl),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    article.author.username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Display article content
              Text(
                article.content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Display likes and bookmarks
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      print('Liked!');
                    },
                  ),
                  Text('${article.numberOfLikes} Likes'),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.bookmark, color: Colors.black),
                    onPressed: () {
                      print('Bookmarked!');
                    },
                  ),
                  Text('${article.numberOfBookmarks} Bookmarks'),
                ],
              ),
              const Spacer(), // Pushes share icon to the right
              // Share icon in its own position
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined, color: Colors.black),
                    onPressed: () {
                      print('Share icon pressed');
                    },
                  ),
                  Text(
                    '${article.numberOfBookmarks}', // Assuming you want bookmarks count here, adjust if needed
                    style: const TextStyle(color: Colors.black), // Changed to black for visibility
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
