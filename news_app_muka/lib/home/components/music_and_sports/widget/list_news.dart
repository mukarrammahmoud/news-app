import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/data/local_storage/local_storage_hive.dart';
import 'package:news_app_muka/data/model/news_model.dart';
import 'package:news_app_muka/home/components/music_and_sports/bloc/music_and_sport_cubit.dart';
import 'package:news_app_muka/home/components/music_and_sports/widget/card_news.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class ListVeiwNews extends StatelessWidget {
  const ListVeiwNews({
    super.key,
    required this.newsList,
  });
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      backgroundColor: Colors.white,
      displacement: 50,
      indicatorBuilder: (context, controller) {
        return const Icon(
          Icons.refresh,
          color: Colors.blue,
          size: 30,
        );
      },
      onRefresh: () => context.read<MusicAndSportCubit>().refreshToGetData(),
      child: Scrollbar(
        trackVisibility: true,
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return CardNews(
              isSaved: context.read<HiveStorage>().isKeyExist(newsList.elementAt(index).publishedAt!),
              onTapNews: () => context
                  .read<MusicAndSportCubit>()
                  .onTapNews(newsList.elementAt(index)),
              news: newsList.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}
