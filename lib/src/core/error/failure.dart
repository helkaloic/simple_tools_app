import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class NoFileFailure extends Failure {
  const NoFileFailure(super.message);
}

class UnhandleFailure extends Failure {
  const UnhandleFailure(super.message);
}
