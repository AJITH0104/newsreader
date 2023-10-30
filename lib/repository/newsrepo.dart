import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newreader/models/model.dart';

class newsrepo {
  getNews(String category, String country) async {
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=110732b003ae42cd804bd43a728cd966');
    try {
      http.Response res = await http.get(uri);
      print(res.statusCode);
      return newsresponse.fromJson(jsonDecode(res.body));
    } catch (e) {
      print("$e this is the error");
      return newsresponse.showError(e);
    }
  }
}
