import 'package:dio/dio.dart';
import 'package:news_app/config/network/api_endpoints.dart';
import 'package:news_app/features/top_headlines/headline_model.dart';


class NetworkRequest{
  final dio = Dio();


  Future<List<Results>?> getTopHeading() async {

    final response = await dio.get(ApiEndpoints.topheadlines);

    if(response.statusCode==200 || response.statusCode==201){
      ///Success

      return HeadlineModel.fromJson(response.data).results;
    }
    else{
      ///failure
      return[];
    }

    print('News Response');
    print(response);
  }
}