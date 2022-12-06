import 'package:flutter/foundation.dart';
import '../models/comments_model.dart';
import 'package:http/http.dart' as http;

class CommentsService {
  Future<Comments?> getComments(String newUrl) async {
    try{
      var url = Uri.parse(newUrl);
      var response = await http.get(url);
      if(response.statusCode == 200){
        Comments comments = commentsFromJson(response.body);
        return comments;
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
        print('DARIUS LOCUST - An Error Has Occurred: $e');
      }
    }
    return null;
  }
}

class NetworkError extends Error{}