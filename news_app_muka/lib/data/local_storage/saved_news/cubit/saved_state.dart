part of 'saved_cubit.dart';

class SavedState extends Equatable {
  const SavedState({
     this.newsList=const[],
  });
  final List<NewsModel> newsList;
  SavedState copyWith({
List<NewsModel>? newsList
  })=>SavedState(newsList: newsList??this.newsList);
  @override
  List<Object> get props => [
        newsList,
      ];
}
