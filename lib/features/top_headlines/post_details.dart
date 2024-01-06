import 'package:flutter/material.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';

class PostDetailsPage extends StatelessWidget {
  final Results post;

  PostDetailsPage(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title ?? ''),
      ),
      body: ListView(
        children: [
          Image.network(
            post.imageUrl ?? '',
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.content ?? '',
              style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
