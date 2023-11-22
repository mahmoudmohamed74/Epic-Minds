import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection Time Out With Api Server");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("Send Time Out With Api Server");

      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive Time Out With Api Server");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Bad Certificate Exception");

      case DioExceptionType.badResponse:
        {
          print(dioError.response!.data);
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          );
        }
      case DioExceptionType.cancel:
        return const ServerFailure("Cancel Exception");

      case DioExceptionType.connectionError:
        return const ServerFailure("Connection Error");

      case DioExceptionType.unknown:
        return const ServerFailure("unknown Exception");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return const ServerFailure("Your request not found, Please Try Later!");
    } else if (statusCode == 500) {
      return const ServerFailure("Internal server error, Please Try Later!");
    } else {
      return const ServerFailure("Opps there was an error, Please Try Later!");
    }
  }
}

class LocalDataDataBaseFailure extends Failure {
  const LocalDataDataBaseFailure(super.errorMessage);
}
