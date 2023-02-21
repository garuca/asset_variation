abstract class Failure implements Exception {
  String error;
  Failure(this.error);
}

class DataSourceError extends Failure {
  DataSourceError(super.error);
}

class EmptyList extends Failure {
  EmptyList(super.error);
}

class ErrorSearch extends Failure {
  ErrorSearch(super.error);
}

class DataSourceResultNull extends Failure {
  DataSourceResultNull(super.error);
}

class Error extends Failure {
  Error(super.error);
}
