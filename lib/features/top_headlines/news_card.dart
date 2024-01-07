import 'package:flutter/material.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
import 'package:news_app/features/top_headlines/post_details.dart';

class NewsCard extends StatelessWidget {
   NewsCard({required this.result,super.key});

  Results result;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetailsPage(result),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result.title ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                result.imageUrl ?? '',
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context,Object error,Stacktrace){

                  return SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(result.description ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(),),
            ),

            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(result.creator !=null ?
                result.creator!.isNotEmpty ?
                result.creator.toString(): '':'',
                    style:TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    )
                ),

                Text("Date: ${getPublishedDate(result.pubDate ?? '')}",
                    style:TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  getPublishedDate(String date) {

    if(date.isEmpty) return '';

    return date.substring(0,11);

  }
}
