import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app_muka/config/enm/cateogry_type_news.dart';
import 'package:news_app_muka/data/api/news_api.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/data/model/result_api.dart';

class NewaApiRepo {
  NewaApiRepo({required this.newsApi});
  final NewsApi newsApi;
  Future<ResultApi> getNews({
    required CategoryTypeNews categoryTypeNews,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;

    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());
    if (result == true) {
      ResultApi resultApi =
          await newsApi.getNews(categoryTypeNews: categoryTypeNews);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
        return ResultApi(isDone: true, resultOrError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }

  Future<ResultApi> getNewsSearch({
    required String searchText,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;

    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());
    if (result == true) {
      ResultApi resultApi = await newsApi.getNewsSearch(searchText: searchText);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultOrError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
     
        return ResultApi(isDone: true, resultOrError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(isDone: false, resultOrError: "No Internet Access");
    }
  }
}
