class Failure {
  Failure(this.message);
  final String message;
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('No internet connection.');
}

class ServerFailure extends Failure {
  ServerFailure(this.statusCode) : super('Server error: $statusCode');
  final int? statusCode;
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
