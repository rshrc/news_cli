import 'dart:async';
import 'package:http/http.dart' as http;

class GetNews {
  String URL, API_KEY;

  GetNews({
    this.URL,
    this.API_KEY,
  }) {
    this.URL = this.URL + this.API_KEY;
  }

  Future<String> getNews() async {
    final response = await http.get(this.URL);
    return response.body;
  }
}
