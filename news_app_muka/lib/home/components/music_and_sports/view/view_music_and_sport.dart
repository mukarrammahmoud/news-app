import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/config/enm/cateogry_type_news.dart';
import 'package:news_app_muka/config/enm/loading_type.dart';
import 'package:news_app_muka/data/api/news_api.dart';
import 'package:news_app_muka/data/repostory/news_api.dart';
import 'package:news_app_muka/home/components/music_and_sports/bloc/music_and_sport_cubit.dart';
import 'package:news_app_muka/home/components/music_and_sports/widget/list_news.dart';
import 'package:news_app_muka/home/components/music_and_sports/widget/show_error.dart';
import 'package:shimmer/shimmer.dart';

class ViewMusicAndSport extends StatelessWidget {
  const ViewMusicAndSport({super.key, required this.categoryTypeNews});
  final CategoryTypeNews categoryTypeNews;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicAndSportCubit>(
      create: (contextA) => MusicAndSportCubit(
        newaApiRepo: NewaApiRepo(
          newsApi: NewsApi(),
        ),
        categoryTypeNews: categoryTypeNews,
        context: context,
      ),
      child: BlocBuilder<MusicAndSportCubit, MusicAndSportState>(
        builder: (context, state) {
          if (state.loadingType == LoadingType.loading) {
            return Center(
              child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: 
                  const Text(
                    'Loading...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          } else if (state.loadingType == LoadingType.error) {
            return ShowError(errorMessage: state.errorMessage);
          } else {
            return ListVeiwNews(newsList: state.listNews);
          }
        },
      ),
    );
  }
}
