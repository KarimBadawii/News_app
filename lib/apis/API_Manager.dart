import 'dart:convert';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;
import '../models/source_model.dart';

// https://newsapi.org
// /v2/everything
// ?q=bitcoin&
// apiKey=85ec4734e96e423f86a81823344eeb1a
class ApiManager {
  static Future<NewsModel> getNews(String id) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "85ec4734e96e423f86a81823344eeb1a",
      "sources": id,
    });
    http.Response responce = await http.get(url);
    var jsonFormat = jsonDecode(responce.body);
    return NewsModel.fromJson(jsonFormat);
  }

  // https://newsapi.org/v2/top-headlines/sources?apiKey=85ec4734e96e423f86a81823344eeb1a
  static Future<SourceModel> getSources(String catId) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=85ec4734e96e423f86a81823344eeb1a&category=$catId");
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    return SourceModel.fromJson(jsonFormat);
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=85ec4734e96e423f86a81823344eeb1a
  static Future<NewsModel> getSearched(String query) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&apiKey=85ec4734e96e423f86a81823344eeb1a");
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    return NewsModel.fromJson(jsonFormat);
  }
