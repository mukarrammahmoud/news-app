import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/colors.dart';
import 'package:news_app_muka/home/bloc/cubit/home_cubit.dart';
import 'package:news_app_muka/home/widgets/home_body.dart';
import 'package:news_app_muka/home/widgets/template_category_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              BlocSelector<HomeCubit, HomeState, bool>(
                selector: (state) {
                  return state.isDarkMode;
                },
                builder: (context, state) {
                  return IconButton(
                    onPressed: () => context.read<HomeCubit>().onTapThemeMode(),
                    icon: Icon(state ? Icons.sunny : Icons.dark_mode),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            leading: IconButton(
                onPressed: () =>
                    context.read<HomeCubit>().goToSavedNews(context),
                icon: const Icon(
                  Icons.bookmark,
                  size: 25,
                )),
            backgroundColor: primaryColor,
            elevation: 7,
            centerTitle: true,
            title: const Column(
              children: [
                Text(
                  "News App",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text("US", style: TextStyle(fontSize: 20, color: Colors.red)),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 100,
            color: primaryColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 20,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.selctedPage != current.selctedPage,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TemplateCategoriesTitle(
                      onTap: () =>
                          context.read<HomeCubit>().onTapTitleBottomBar(0),
                      isSelected: state.selctedPage == 0,
                      iconData: Icons.computer,
                      title: "Technology",
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TemplateCategoriesTitle(
                      onTap: () =>
                          context.read<HomeCubit>().onTapTitleBottomBar(1),
                      isSelected: state.selctedPage == 1,
                      iconData: Icons.sports_basketball,
                      title: "Sports",
                    ),
                  ],
                );
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () => context.read<HomeCubit>().onTapSearch(context),
            child: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
          body: const HomeBody(),
        );
      }),
    );
  }
}
