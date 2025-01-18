import 'package:code_fetch_mobile_app/constants/http_constants.dart';
import 'package:dio/dio.dart';
import 'logger_service.dart';

import 'dart:convert';


// class CustomBackgroundTransformer extends BackgroundTransformer {
//   @override
//   Future<dynamic> transformResponse(RequestOptions options, ResponseBody responseBody) async {
//     // Decode the response stream to a string
//     final decodedString = await utf8.decoder.bind(responseBody.stream).join();
//
//     // Parse the string to a JSON map
//     try {
//       return jsonDecode(decodedString);
//     } catch (e) {
//       throw Exception('Failed to parse response: $e');
//     }
//   }
// }



class NetworkService {
  static const _baseWebUrl = HttpConstants.baseUrl;
  static late Dio _dio;
  static String? _token; // Variable to store the token

  // Private constructor for singleton pattern
  NetworkService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseWebUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        responseType: ResponseType.json,
      ),
    );

    // Add interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        LoggerService.logs('*****Request*******:');
        LoggerService.logs('  method: ${options.method}');
        LoggerService.logs('  baseUrl: ${options.baseUrl}');
        LoggerService.logs('  path: ${options.path}');
        LoggerService.logs('  fullUrl: ${options.uri}');
        LoggerService.logs('  headers: ${options.headers}');
        LoggerService.logs('  queryParameters: ${options.queryParameters}');
        LoggerService.logs('  data: ${options.data}');
        LoggerService.logs('  connectTimeout: ${options.connectTimeout}');
        LoggerService.logs('  receiveTimeout: ${options.receiveTimeout}');
        LoggerService.logs('  sendTimeout: ${options.sendTimeout}');
        LoggerService.logs('  extra: ${options.extra}');
        return handler.next(options); // Continue
      },
      onResponse: (response, handler) {
        LoggerService.logs('*******Response**************: ');
        LoggerService.logs('  statusCode: ${response.statusCode}');
        LoggerService.logs('  statusMessage: ${response.statusMessage}');
        LoggerService.logs('  data: ${response.data}');
        LoggerService.logs('  headers: ${response.headers}');
        LoggerService.logs('  request: ${response.requestOptions.uri}');
        return handler.next(response); // Continue
      },
      onError: (DioException e, handler) {
        LoggerService.logs('Error:');
        LoggerService.logs('  message: ${e.message}');
        LoggerService.logs('  type: ${e.type}');
        if (e.response != null) {
          LoggerService.logs('  statusCode: ${e.response?.statusCode}');
          LoggerService.logs('  statusMessage: ${e.response?.statusMessage}');
          LoggerService.logs('  data: ${e.response?.data}');
        }
        LoggerService.logs('  request: ${e.requestOptions.uri}');
        return handler.next(e); // Continue
      },
    ));

    // _dio.transformer = CustomBackgroundTransformer();
  }

  // Single instance of the class
  static final NetworkService _instance = NetworkService._internal();

  // Factory constructor to return the singleton instance
  factory NetworkService() {
    return _instance;
  }

  // Initializer method to set the token
  void setAuthToken(String token) {
    _token = token; // Save the token

    // Update the Dio instance's headers to include the Authorization token
    _dio.options.headers["Authorization"] = "$_token";
  }

  Future<Response> postRequestWithoutHeaders(
      String endpoint, dynamic payload) async {
    try {
      return await _dio.post(
        endpoint,
        data: payload,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message']
          ?? e.message ?? 'Unknown error';

      // Throw custom exception
      return Response(
        requestOptions: e.requestOptions,
        statusCode: statusCode,
        data: {
          'status': statusCode,
          'message': message,
        },
      );
    }
  }

  // POST request with custom headers
  Future<Response> postRequestWithHeaders(
      String endpoint, Map<String, String> headers, dynamic payload) async {
    try {
      return await _dio.post(
        endpoint,
        data: payload,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      // Extract status code and message from the response
      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data['message'] ?? e.message ?? 'Unknown error';

      // Throw custom exception
      return Response(
        requestOptions: e.requestOptions,
        statusCode: statusCode,
        data: {
          'status': statusCode,
          'message': message,
        },
      );
    }
  }

  // GET request with query parameters
  Future<Response> httpGetRequestWithQueryStrings(
      String endpoint, Map<String, String> queryParams) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
    } on DioException catch (e) {
      // Extract status code and message from the response
      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data['message'] ?? e.message ?? 'Unknown error';

      // Throw custom exception
      return Response(
        requestOptions: e.requestOptions,
        statusCode: statusCode,
        data: {
          'status': statusCode,
          'message': message,
        },
      );
    }
  }

  // Simple GET request
  Future<Response> httpGetRequest(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioException catch (e) {
      // Extract status code and message from the response
      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data['message'] ?? e.message ?? 'Unknown error';

      // Throw custom exception
      return Response(
        requestOptions: e.requestOptions,
        statusCode: statusCode,
        data: {
          'status': statusCode,
          'message': message,
        },
      );
    }
  }

  // DELETE request with custom headers
  Future<Response> deleteRequestWithHeaders(
      String endpoint, Map<String, String> headers) async {
    try {
      return await _dio.delete(
        endpoint,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      // Extract status code and message from the response
      final statusCode = e.response?.statusCode;
      final message =
          e.response?.data['message'] ?? e.message ?? 'Unknown error';

      // Throw custom exception
      return Response(
        requestOptions: e.requestOptions,
        statusCode: statusCode,
        data: {
          'status': statusCode,
          'message': message,
        },
      );
    }
  }
}
