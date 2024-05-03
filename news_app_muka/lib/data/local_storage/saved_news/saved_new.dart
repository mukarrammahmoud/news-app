import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/data/local_storage/local_storage_hive.dart';
import 'package:news_app_muka/data/local_storage/saved_news/cubit/saved_cubit.dart';
import 'package:news_app_muka/data/local_storage/saved_news/widgets/card_saved_news.dart';
import 'package:news_app_muka/data/model/news_model.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key,
  

  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedCubit>(
      create: (contextA) => SavedCubit(context: context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Saved News",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: BlocBuilder<SavedCubit, SavedState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  NewsModel news = state.newsList.elementAt(index);
                  return CardSavedNews(
                    // onChangeSavedNews:(value) {
                      
                    // } ,
                      news: news,
                      onTapNews:()=> context.read<SavedCubit>().onTapNews(news),
                      isSaved: context.read<HiveStorage>().isKeyExist(news.publishedAt!));
                });
          },
        ),
      ),
    );
  }
}
