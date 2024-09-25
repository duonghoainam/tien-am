typedef SuccessCallback<T> = T Function(SuccessNetworkResponse res);
typedef ErrorCallback<T> = T Function(ErrorNetworkResponse res);

sealed class NetworkResponse {
  const NetworkResponse();

  T when<T>(
    SuccessCallback onSuccess,
    ErrorCallback onError,
  ) {
    switch (this) {
      case ErrorNetworkResponse err:
        return onError(err);
      case SuccessNetworkResponse success:
        return onSuccess(success);
    }
  }
}

final class ErrorNetworkResponse extends NetworkResponse {
  final String message;

  const ErrorNetworkResponse(this.message);
}

final class SuccessNetworkResponse extends NetworkResponse {
  final dynamic data;

  const SuccessNetworkResponse(this.data);
}
