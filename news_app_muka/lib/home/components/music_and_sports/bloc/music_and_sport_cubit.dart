import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/config/enm/cateogry_type_news.dart';
import 'package:news_app_muka/config/enm/loading_type.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/data/model/result_api.dart';
import 'package:news_app_muka/data/repostory/news_api.dart';
import 'package:news_app_muka/home/components/music_and_sports/widget/bottom_sheet.dart';

part 'music_and_sport_state.dart';

class MusicAndSportCubit extends Cubit<MusicAndSportState> {
  final NewaApiRepo newaApiRepo;
  final BuildContext context;
  final CategoryTypeNews categoryTypeNews;
  //  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState> (),
  MusicAndSportCubit({
    required this.context,
    required this.newaApiRepo,
    required this.categoryTypeNews,
  }) : super(MusicAndSportState(
          scaffoldKey: GlobalKey<ScaffoldState>(),
        )) {
    getMusicNews();
  }
  Future<void> getMusicNews() async {
    final ResultApi resultApi =
        await newaApiRepo.getNews(categoryTypeNews: categoryTypeNews);
    if (resultApi.isDone) {
      List<NewsModel> newsList = List.from(resultApi.resultOrError);
      if (isClosed) return;

      emit(state.copyWith(
          errorMessage: "",
          listNews: newsList,
          loadingType: LoadingType.successful));
    } else {
      if (isClosed) return;

      emit(state.copyWith(
          errorMessage: resultApi.resultOrError,
          loadingType: LoadingType.error));
    }
  }

  getStateShowMore() {
    if (isClosed) return;

    emit(
      state.copyWith(
          isShowReadMore: !state.isShowReadMore,
          readMoreOrHidhen:
              state.isShowReadMore == false ? "" : '   read more...'),
    );
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.of(context).pushNamed(
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }

  Future refreshToGetData() async {
    if (isClosed) return;

    emit(state.copyWith(
      loadingType: LoadingType.loading,
    ));
    await getMusicNews();
  }

  void onTapShare(GlobalKey<ScaffoldState> scaffoldKey) {
    showBottomSheet(
      context: context,
      builder: (context) => const ComponentsBottomSheet(),
    );
    // scaffoldKey.currentState!
    //     .showBottomSheet((context) => const ComponentsBottomSheet());
  }

  Future<bool> downloadImage(String urlImage) async {
    final respone = await http.get(Uri.parse(urlImage));
    final bytes = respone.bodyBytes;
    final result = await ImageGallerySaver.saveImage(
      name: "Muka News",
      quality: 60,
      Uint8List.fromList(bytes),
    );
    print(result['isSuccess']);
    return result['isSuccess'];
  }

  Future lunchUrl(String url) async {
    await lunchUrl(url);
  }
}
