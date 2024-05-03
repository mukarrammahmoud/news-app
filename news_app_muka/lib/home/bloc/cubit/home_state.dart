part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selctedPage;
  final List<Widget> pagesInHome;
  final PageController pageController;
  final bool isDarkMode;
  const HomeState({
    this.isDarkMode = true,
    required this.pageController,
    this.selctedPage = 0,
    required this.pagesInHome,
  });
  HomeState copyWith({int? selectedPage, bool? isDarkMode}) => HomeState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        pagesInHome: pagesInHome,
        pageController: pageController,
        selctedPage: selectedPage ?? selctedPage,
      );
  @override
  List<Object> get props =>
      [selctedPage, pageController, pagesInHome, isDarkMode];
}
