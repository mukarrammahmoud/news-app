import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_muka/config/enm/loading_type.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/data/api/news_api.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/data/model/result_api.dart';
import 'package:news_app_muka/data/repostory/news_api.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BuildContext context;
  SearchCubit({
    required this.context,
  }) : super(SearchState(
          editingController: TextEditingController(),
        ));
  void onTapOkOnDialog() {
    emit(state.copyWith(
      loadingType: LoadingType.initial,
      errorMessage: "",
    ));
  }

  Future<void> searchText() async {
    emit(state.copyWith(
      loadingType: LoadingType.loading,
    ));
    String search = state.editingController.text.trim();
    NewaApiRepo newaApiRepo = NewaApiRepo(
      newsApi: NewsApi(),
    );
    ResultApi resultApi = await newaApiRepo.getNewsSearch(searchText: search);
    if (resultApi.isDone) {
      List<NewsModel> news = List.from(resultApi.resultOrError);
      if (isClosed) return;
      emit(
        state.copyWith(loadingType: LoadingType.successful, newsList: news),
      );
    } else {
      if (isClosed) return;
      emit(state.copyWith(
        errorMessage: resultApi.resultOrError,
        loadingType: LoadingType.error,
      ));
    }
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.of(context).pushNamed(
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }
}
