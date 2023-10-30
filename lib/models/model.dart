class newsmodel {
  final String author;
  final String title;
  final String des;
  final String img;
  final String date;
  final String url;

  newsmodel(this.author, this.title, this.des, this.img, this.date, this.url);
  newsmodel.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        title = json['title'],
        des = json['description'],
        img = json['urlToImage'],
        date = json['publishedAt'],
        url = json['url'];
}

class newsresponse {
  final List<newsmodel> news;
  final Object error;
  newsresponse(this.news, this.error);
  newsresponse.fromJson(Map<String, dynamic> json)
      : news = (json['articles'] as List)
            .map((e) => newsmodel.fromJson(e))
            .toList(),
        error = "";
  newsresponse.showError(Object errorvalue)
      : news = [],
        error = errorvalue;
}
