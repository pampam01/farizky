// lib/screens/articles_screen.dart
import 'package:flutter/material.dart';
import 'package:myapp/models/article_model.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  final List<Article> allArticles = const [
    Article(
      title: "Manfaat Tidur Cukup",
      category: "Gaya Hidup",
      imageUrl: "https://images.pexels.com/photos/3771045/pexels-photo-3771045.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: "...",
    ),
    Article(
      title: "10 Makanan Super",
      category: "Nutrisi",
      imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: "...",
    ),
    Article(
      title: "Pentingnya Olahraga",
      category: "Gaya Hidup",
      imageUrl: "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: "...",
    ),
    Article(
      title: "Mengelola Stres",
      category: "Mental",
      imageUrl: "https://images.pexels.com/photos/3847631/pexels-photo-3847631.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: "...",
    ),
    Article(
      title: "Diet Mediterania",
      category: "Nutrisi",
      imageUrl: "https://images.pexels.com/photos/128402/pexels-photo-128402.jpeg?auto=compress&cs=tinysrgb&w=600",
      content: "...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final categories = allArticles.map((e) => e.category).toSet().toList();

    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabs: categories.map((category) => Tab(text: category)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: categories.map((category) {
                final filteredArticles = allArticles.where((a) => a.category == category).toList();
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredArticles.length,
                  itemBuilder: (context, index) {
                    final article = filteredArticles[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      child: ListTile(
                        leading: Image.network(article.imageUrl, width: 80, fit: BoxFit.cover),
                        title: Text(article.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Membaca: ${article.title}')),
                          );
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}