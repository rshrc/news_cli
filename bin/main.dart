import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_cli/src/news_cli.dart';

String URL =
    "https://newsapi.org/v2/top-headlines?sources=medical-news-today&apiKey=";

void main(List<String> args) async {
  String API_KEY = args[0];
  URL = URL + API_KEY;
  var newsData;
  await getNews().then((c) {
    newsData = jsonDecode(c);
  });

  GetNews(URL: URL, API_KEY: API_KEY).getNews().then((c) {
    newsData = jsonDecode(c);
  });

  // Testing
  print(newsData['articles'][0]['title']);
}

Future<String> getNews() async {
  final response = await http.get(URL);
  return response.body;
}
