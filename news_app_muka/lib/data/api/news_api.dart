import 'package:news_app_muka/config/enm/cateogry_type_news.dart';
import 'package:news_app_muka/config/extensions/string.dart';
import 'package:news_app_muka/data/model/result_api.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Future<ResultApi> getNews({
    required CategoryTypeNews categoryTypeNews,
  }) async {
    try {
      Uri uri = Uri.https("".baseUrlNews, ''.baseUrlWithTopHeadlines, {
        "country": "us",
        "category": categoryTypeNews.value,
        "apiKey": "".getApiKey,
      });
      var respone = await http.get(uri);
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }

  Future<ResultApi> getNewsSearch({
    required String searchText,
  }) async {
    try {
      Uri uri = Uri.https("".baseUrlNews, ''.baseUrlWithEveryThing, {
        "q": searchText,
        "sortBy": 'publishedAt',
        "apiKey": "".getApiKey,
      });
      
      var respone = await http.get(uri);
      if (respone.statusCode == 200) {
        return ResultApi(isDone: true, resultOrError: respone.body);
      } else {
        return ResultApi(isDone: false, resultOrError: 'Some Error In Server');
      }
    } catch (e) {
      return ResultApi(isDone: false, resultOrError: "Some Error");
    }
  }
}
