class Result<T> {
  final bool isSucces;
  final T? data;
  final String? errorMessage;

  Result.success(this.data)
      : isSucces = true,
        errorMessage = null;

  Result.failure(this.errorMessage)
      : isSucces = false,
        data = null;
}
