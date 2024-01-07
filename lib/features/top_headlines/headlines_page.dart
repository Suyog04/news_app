

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
import 'package:news_app/features/top_headlines/news_card.dart';
import 'package:news_app/features/top_headlines/post_details.dart';

class HeadlinePage extends StatefulWidget {
  const HeadlinePage({super.key});

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('News 📰',
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30),)),


      body: ListView(
        children: [

          FutureBuilder<List<Results>?>(
              future: NetworkRequest().getTopHeading(),
              builder: (context, snapshot){

                if(snapshot.hasData){
                  var result= snapshot.data ?? [];

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: result.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsCard(
                          result: result[index],
                        ),
                      );
                    },
                  );


                }
                else if(snapshot.hasError){;
                  return Center(child: Text('Error Fetching Data'),);
                }

                return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }

  getPublishedDate(String date) {

    if(date.isEmpty) return '';

    return date.substring(0,11);

  }
}
