import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/data/local_storage/local_storage_hive.dart';
import 'package:news_app_muka/data/model/news_model.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  final BuildContext context;
  SavedCubit({
    required this.context,
  }) : super(const SavedState()) {
    getAllSavedNews();
  }
  void getAllSavedNews() {
    List<Map> allNewsSavedJson =
        context.read<HiveStorage>().getAllSavedNews();
    List<NewsModel> newsList = List.generate(
      allNewsSavedJson.length,
      (index) => NewsModel.fromJson(
        allNewsSavedJson.elementAt(index),
      ),
    );
    emit(state.copyWith(newsList: newsList));
  }

  void removeFromList(String key) {
    List<NewsModel> newsList = List.from(state.newsList);
    newsList.removeWhere((element) => element.title == key);
    emit(state.copyWith(newsList: newsList));
  }

  void onTapNews(NewsModel news) {
    Navigator.of(context).pushNamed(
      AppRoot.showNewsContent,
      arguments: news,
    );
  }
}
