import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/config.dart';

class DioApi {
  final Dio dio = Dio(_baseOptions);

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config.apiUrl,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    headers: {"Accept": "application/json"},
    contentType: "application/json",
  );

  DioApi() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
