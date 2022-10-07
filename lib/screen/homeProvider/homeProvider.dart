import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/screen/newsModel/NewsModel.dart';
class homeProvider extends ChangeNotifier
{
  String apiLink = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-07&sortBy=publishedAt&apiKey=d230b961382c473f9f014486aabbcd71";
  int i =0;


  void bottomindex(int index)
  {
    i = index;
    notifyListeners();
  }

  Future<NewsModel> apiCalling()
  async {
    var jsonString = await http.get(Uri.parse(apiLink));
    var json = jsonDecode(jsonString.body);

    return NewsModel.fromJson(json);

  }
}