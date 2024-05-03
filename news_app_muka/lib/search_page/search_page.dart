import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/search_page/bloc/cubit/search_cubit.dart';
import 'package:news_app_muka/search_page/widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (contextA) => SearchCubit(context: context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Search Page",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: const SearchBody(),
      ),
    );
  }
}
