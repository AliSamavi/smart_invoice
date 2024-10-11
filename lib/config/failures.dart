abstract class Failure {
  final String? message;

  const Failure(this.message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure([super.message]);
}