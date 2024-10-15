import 'package:flutter/material.dart';
import '../article/model.dart';

class BlogCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const BlogCard({Key? key, required this.article, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(article.author.profileUrl),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.author.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black, // Changed to black for visibility
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Created: ${article.createdAt}", // Format this date as needed
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black, // Changed to black for visibility
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              // Icons row
              Row(
                children: [
                  // Favorite and Bookmark icons in the same row
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.black),
                        onPressed: () {
                          print('Heart icon pressed');
                        },
                      ),
                      Text(
                        '${article.numberOfLikes}', // Display number of likes
                        style: const TextStyle(color: Colors.black), // Changed to black for visibility
                      ),
                      const SizedBox(width: 16), // Space between icons
                      IconButton(
                        icon: const Icon(Icons.bookmark_border, color: Colors.black), // Bookmark icon
                        onPressed: () {
                          print('Bookmark icon pressed');
                        },
                      ),
                      Text(
                        '${article.numberOfBookmarks}', // Display number of bookmarks
                        style: const TextStyle(color: Colors.black), // Changed to black for visibility
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
