import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_muka/home/components/music_and_sports/bloc/music_and_sport_cubit.dart';

class ShowError extends StatelessWidget {
  const ShowError({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        IconButton(
          onPressed: () =>
              context.read<MusicAndSportCubit>().refreshToGetData(),
          icon: const Icon(
            Icons.refresh,
            size: 40,
          ),
        ),
      ],
    );
  }
}
