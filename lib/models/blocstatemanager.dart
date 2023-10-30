import 'package:newreader/repository/newsrepo.dart';
import 'package:rxdart/rxdart.dart';

import 'model.dart';

class getnewsbloc {
  final BehaviorSubject<newsresponse> subs = BehaviorSubject<newsresponse>();
  final newsrepo newsss = newsrepo();
  BehaviorSubject<newsresponse> get subs2 => subs;
  getnews(String category, String country) async {
    newsresponse news = await newsss.getNews(category, country);
    subs.sink.add(news);
  }

  dispose() {
    subs.close();
  }
}
