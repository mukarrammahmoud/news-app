import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_muka/config/enm/cateogry_type_news.dart';
import 'package:news_app_muka/config/root/app_root.dart';
import 'package:news_app_muka/home/components/music_and_sports/view/view_music_and_sport.dart';
import 'package:news_app_muka/main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuildContext context;
  HomeCubit({
    required this.context,
  }) : super(HomeState(pagesInHome: const [
          ViewMusicAndSport(categoryTypeNews: CategoryTypeNews.music),
          ViewMusicAndSport(categoryTypeNews: CategoryTypeNews.sport),
        ], pageController: PageController())) {
    getThemMode();
  }

  void onTapTitleBottomBar(int index) {
    if (isClosed) return;

    emit(state.copyWith(selectedPage: index));
    state.pageController.animateToPage(index,
        curve: Curves.bounceOut, duration: const Duration(microseconds: 500));
  }

  void onTapSearch(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.searchPage);
  }

  void goToSavedNews(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.savedPage);
  }

  void onTapThemeMode() {
    emit(state.copyWith(
      isDarkMode: !state.isDarkMode,
    ));
    sharedPreferences.setBool("theme", state.isDarkMode);
  }

  bool? getThemMode() {
    return sharedPreferences.getBool("theme");
  }
}
