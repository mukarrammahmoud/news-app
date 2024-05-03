import 'package:flutter/material.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/data/local_storage/saved_news/saved_new.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/home/home.dart';
import 'package:news_app_muka/search_page/search_page.dart';
import 'package:news_app_muka/show_details_news/show_details_news.dart';

class OnGenerateRoot {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoot.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case AppRoot.searchPage:
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      case AppRoot.savedPage:
        return MaterialPageRoute(
          builder: (context) => const SavedNews(),
        );
      case AppRoot.showNewsContent:
        NewsModel newsModel = routeSettings.arguments as NewsModel;
        return MaterialPageRoute(
          builder: (context) => ShowDetailsNews(
            newsModel: newsModel,
          ),
        );
    }
    return null;
  }
}
