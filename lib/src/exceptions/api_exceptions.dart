class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

/// Lanzada cuando hay un problema de red (ej. sin conexión, timeout).
class NetworkException extends ApiException {
  NetworkException(String message) : super('Error de red: $message');
}

/// Lanzada para errores de servidor (ej. 404, 500).
class ServerException extends ApiException {
  ServerException(String message) : super('Error del servidor: $message');
}
