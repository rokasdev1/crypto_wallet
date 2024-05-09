class JupiterException implements Exception {
  final int code;
  final String message;
  final StackTrace? stackTrace;

  JupiterException(this.code, this.message, [this.stackTrace]);

  @override
  String toString() {
    return 'Code: $code, Message: $message, Stacktrace: $stackTrace';
  }
}
