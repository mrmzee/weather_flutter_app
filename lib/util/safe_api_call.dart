import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:dio/dio.dart' show DioException, DioExceptionType;

import 'api_exception.dart';

/// Wraps an API call and handles errors uniformly.
Future<Either<String, T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return Right(result);
  } on DioException catch (e) {
    final code = e.response?.statusCode?.toString() ?? '';

    switch (e.type) {
      case DioExceptionType.connectionError:
        return const Left('messages.network_connection_error');

      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const Left('The request timed out.');

      case DioExceptionType.badResponse:
        return Left('A server error occurred. (Code: {$code})');

      default:
        return Left('A network error occurred. (Code: {$code})');
    }
  } on SocketException {
    return const Left('Please check your internet connection');
  } on TimeoutException {
    return const Left('The request timed out.');
  } on ApiException catch (e) {
    return Left(e.message ?? 'An unknown error occurred.');
  } catch (_) {
    return const Left('An unknown error occurred.');
  }
}
