part of 'music_and_sport_cubit.dart';

class MusicAndSportState extends Equatable {
  const MusicAndSportState({
    this.readMoreOrHidhen = '   read more...',
    this.isShowReadMore = false,
    this.listNews = const [],
    this.loadingType = LoadingType.loading,
    this.errorMessage = '',
    required this.scaffoldKey,
  });
  final List<NewsModel> listNews;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final LoadingType loadingType;
  final String readMoreOrHidhen;
  final String errorMessage;
  final bool isShowReadMore;
  MusicAndSportState copyWith({
    String? readMoreOrHidhen,
    bool? isShowReadMore,
    List<NewsModel>? listNews,
    LoadingType? loadingType,
    String? errorMessage,
    GlobalKey<ScaffoldState>? scaffoldKey

  }) =>
      MusicAndSportState(
        scaffoldKey: scaffoldKey??this.scaffoldKey,
          readMoreOrHidhen: readMoreOrHidhen ?? this.readMoreOrHidhen,
          isShowReadMore: isShowReadMore ?? this.isShowReadMore,
          errorMessage: errorMessage ?? this.errorMessage,
          listNews: listNews ?? this.listNews,
          loadingType: loadingType ?? this.loadingType);
  @override
  List<Object> get props =>
      [listNews, loadingType, errorMessage, isShowReadMore, readMoreOrHidhen,scaffoldKey];
}
