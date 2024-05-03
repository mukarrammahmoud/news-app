import 'package:hive/hive.dart';

class HiveStorage {
  Box? boxSavedNews;
  Future<void> initDataBase() async {
    boxSavedNews = await Hive.openBox("SaveNews");
  }

  bool isKeyExist(String key) {
    return boxSavedNews!.keys.contains(key);
  }

  void addOrRemoveNewsFromBox(Map newsJson, String key) async {
    if (isKeyExist(key)) {
      boxSavedNews!.delete(key);
    } else {
      await boxSavedNews!.put(key, newsJson);
    }
  }

  Map getNewsFromBox(String key) {
    return boxSavedNews!.get(key);
  }

  List<Map> getAllSavedNews() {
    List<String> keysInDataBase = List.from(boxSavedNews!.keys);
    List<Map> listJaonNews = [];
    for (var key in keysInDataBase) {
      listJaonNews.add(getNewsFromBox(key));
    }
    return listJaonNews;
  }
}
