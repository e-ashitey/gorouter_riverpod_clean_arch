class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

// UnauthorizedException
class UnauthorizedException extends NetworkException {
  UnauthorizedException() : super('Unauthorized: Please sign in again');
}

// ServerException
class ServerException extends NetworkException {
  ServerException() : super('Server Exception: Please try again later.');
}

// BadRequestException
class BadRequestException extends NetworkException {
  BadRequestException() : super('Bad Request: Please check your input.');
}

// NotFoundException
class NotFoundException extends NetworkException {
  NotFoundException() : super('Resource not found.');
}

// TimeoutException
class TimeoutException extends NetworkException {
  TimeoutException()
      : super('Request timed out: Please check your connection.');
}

// NoInternetException
class NoInternetException extends NetworkException {
  NoInternetException() : super('No Internet Connection.');
}
