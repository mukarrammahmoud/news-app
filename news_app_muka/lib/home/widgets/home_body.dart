import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/home/bloc/cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return PageView.builder(
          itemBuilder: (context, index) {
            return state.pagesInHome.elementAt(index);
          },
          scrollDirection: Axis.horizontal,
          controller: state.pageController,
          itemCount: state.pagesInHome.length,
          onPageChanged: (value) =>
              context.read<HomeCubit>().onTapTitleBottomBar(value),
        );
      },
    );
  }
}
