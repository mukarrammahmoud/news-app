class ResultApi<T> {
  final bool isDone;
  final T resultOrError;
  ResultApi({
    required this.isDone,
    required this.resultOrError,
  });
}
