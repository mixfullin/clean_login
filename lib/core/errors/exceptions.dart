import 'package:clean_login/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  ServerException({required this.errorModel});
  final ErrorModel errorModel;
}

void  handelExceptions(DioException e) {
     switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.sendTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.receiveTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.badCertificate:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.cancel:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.connectionError:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.unknown:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            e.response!.data,
          ),
        );
      case DioExceptionType.badResponse:
        switch(e.response?.statusCode){
          case 400 :
          throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        }
    }
  }