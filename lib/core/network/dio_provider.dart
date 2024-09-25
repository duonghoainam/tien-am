import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:tien_am/core/constants/strings.dart';
import 'package:tien_am/core/network/network_response.dart';

class DioProvider {
  late Dio dio;

  DioProvider({
    String baseUrl = 'https://tinyin.azurewebsites.net',
  }) {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(
            seconds: 10,
          ),
          receiveTimeout: const Duration(
            seconds: 10,
          )),
    );

    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: BackupCacheStore(
            primary: MemCacheStore(),
            secondary: HiveCacheStore('/'),
          ),
        ),
      ),
    );
  }

  Future<NetworkResponse> get(
    String endpoint, {
    String version = 'v1',
    String suffix = 'api',
    Map<String, dynamic>? query,
  }) async {
    String preparePath = '/$suffix/$version/$endpoint';

    final res = await dio.get<NetworkResponse>(
      preparePath,
      queryParameters: query,
    );
    return res.data ??
        const ErrorNetworkResponse(
          AppStrings.networkUnknownError,
        );
  }

  Future<NetworkResponse> post(
    String endpoint, {
    String version = 'v1',
    String suffix = 'api',
    Map? query,
    Object? body,
  }) async {
    String preparePath = '/$suffix/$version/$endpoint';

    final res = await dio.get<NetworkResponse>(
      preparePath,
      data: body,
    );
    return res.data ??
        const ErrorNetworkResponse(
          AppStrings.networkUnknownError,
        );
  }
}
