class ApiError {
  final int statusCode;
  final String errorCode;
  final String message;
  final String? field;

  ApiError({
    required this.statusCode,
    required this.errorCode,
    required this.message,
    this.field,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'] ?? 0,
      errorCode: json['errorCode'] ?? '',
      message: json['message'] ?? '',
      field: json['field'],
    );
  }
}
