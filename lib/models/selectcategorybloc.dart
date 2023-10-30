import 'dart:async';

import 'package:newreader/utils.dart';

class selectcategorybloc {
  final StreamController categorycontroller = StreamController.broadcast();
  final StreamController countrycontroller = StreamController.broadcast();
  Stream get countrystream => countrycontroller.stream;
  String defaultcountry = 'us';
  String defaultcategory = cats[0];
  Stream get catstream => categorycontroller.stream;
  void selectcategory(String cat) {
    categorycontroller.sink.add(cat);
  }

  void selectcountry(String code) {
    countrycontroller.sink.add(code);
  }

  dispose() {
    categorycontroller.close();
    countrycontroller.close();
  }
}
