

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';
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
                        child: Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostDetailsPage(result[index]),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    result[index].title ?? '',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Image.network(
                                  result[index].imageUrl ?? '',
                                  height: 500,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(result[index].description ?? ''),
                                ),
                              ],
                            ),
                          ),
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
}
