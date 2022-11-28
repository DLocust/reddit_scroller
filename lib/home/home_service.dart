import 'package:flutter/foundation.dart';
import 'home_model.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<Posts?> getPosts(String newUrl) async {
    try{
      var url = Uri.parse(newUrl);
      var response = await http.get(url);
      if(response.statusCode == 200){
        Posts posts = postsFromJson(response.body);
        return posts;
      }
      else{
        if (kDebugMode) {
          print('DARIUS LOCUST - Status Code Not 200: ${response.statusCode}');
        }
        return null;
      }
    }
    catch (e){
      if (kDebugMode) {
        print('DARIUS LOCUST - An Error Has Occured: $e');
      }
    }
    return null;
  }
}

class NetworkError extends Error{}