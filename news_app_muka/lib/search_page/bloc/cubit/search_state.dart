part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.newsList = const [],
    this.loadingType = LoadingType.initial,
    this.errorMessage = '',
    required this.editingController,
  });
  final List<NewsModel> newsList;
  final LoadingType loadingType;
  final String errorMessage;
  final TextEditingController editingController;
  SearchState copyWith({
    List<NewsModel>? newsList,
    LoadingType? loadingType,
    String? errorMessage,
  }) =>
      SearchState(
        errorMessage: errorMessage ?? this.errorMessage,
        loadingType: loadingType ?? this.loadingType,
        newsList: newsList ?? this.newsList,
        editingController: editingController,
      );
  @override
  List<Object> get props => [
        newsList,
        loadingType,
        errorMessage,
        editingController,
      ];
}
