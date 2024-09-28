import 'package:dio/dio.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/network/network_response.dart';

class ResponseMapperInterceptor extends InterceptorsWrapper {
  ResponseMapperInterceptor() : super();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    final statusCode = response.statusCode;
    if (statusCode == null) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: AppStrings.networkUnknownError,
        ),
      );
    }

    if (data is List) {
      handler.next(
        response,
      );
    } else if (data is Map) {
      if (data.containsKey('message')) {
        if (statusCode >= 400) {
          return handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              message: data['message'] ?? AppStrings.networkUnknownError,
            ),
          );
        }
        return handler.resolve(
          Response(
            requestOptions: response.requestOptions,
            data: SuccessNetworkResponse(
              data['message'],
            ),
          ),
        );
      }

      final innerData = data['data'];
      return handler.resolve(
        Response(
          requestOptions: response.requestOptions,
          data: SuccessNetworkResponse(
            innerData,
          ),
        ),
      );
    } else {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: ErrorNetworkResponse(
          err.message ?? '',
        ),
      ),
    );
  }
}
