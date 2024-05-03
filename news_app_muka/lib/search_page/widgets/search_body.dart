import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/colors.dart';
import 'package:news_app_muka/config/enm/loading_type.dart';
import 'package:news_app_muka/search_page/bloc/cubit/search_cubit.dart';
import 'package:news_app_muka/search_page/widgets/card_search_news.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          previous.loadingType != current.loadingType,
      listener: (contextA, state) {
        switch (state.loadingType) {
          case LoadingType.loading:
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text("Loading")
                            ],
                          ),
                        ),
                      ),
                    ));
            break;
          case LoadingType.error:
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                                size: 60,
                              ),
                              const Text("Error"),
                              Text(state.errorMessage),
                              ElevatedButton(
                                  onPressed: () => contextA
                                      .read<SearchCubit>()
                                      .onTapOkOnDialog(),
                                  child: const Text("Ok"))
                            ],
                          ),
                        ),
                      ),
                    ));
            break;
          case LoadingType.successful:
          case LoadingType.initial:
            Navigator.pop(context);
            break;
          default:
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) =>
                    context.read<SearchCubit>().searchText(),
                textInputAction: TextInputAction.search,
                cursorColor: readMoreColor,
                decoration: InputDecoration(
                  hintText: 'Enter Text ',
                  suffixIcon: IconButton(
                      onPressed: () => context.read<SearchCubit>().searchText(),
                      icon: const Icon(
                        Icons.search,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: readMoreColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: readMoreColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: cardColor,
                      width: 2,
                    ),
                  ),
                ),
                controller: state.editingController,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context, index) {
                      return CardSearchNews(
                        onTapNews: () => context
                            .read<SearchCubit>()
                            .onTapNews(state.newsList.elementAt(index)),
                        news: state.newsList.elementAt(index),
                      );
                    }))
          ],
        );
      },
    );
  }
}
