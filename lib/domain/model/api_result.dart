sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data);
}

class Error<T> extends ApiResult<T> {
  final Exception exception;

  Error(this.exception);
}

class Loading<T> extends ApiResult<T> {
  const Loading();
}
