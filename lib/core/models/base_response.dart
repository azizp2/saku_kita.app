import 'api_error.dart';
import 'pagination.dart';

class BaseResponse<T> {
  final bool success;
  final T? data;
  final Pagination? pagination;
  final List<ApiError> errors;

  BaseResponse({
    required this.success,
    required this.data,
    required this.pagination,
    required this.errors,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic data) fromJson,
  ) {
    final response = json['response'];

    return BaseResponse<T>(
      success: json['success'] ?? false,

      data: response?['data'] != null ? fromJson(response['data']) : null,

      pagination: response?['pagination'] != null
          ? Pagination.fromJson(response['pagination'])
          : null,

      errors: (json['errors'] as List<dynamic>? ?? [])
          .map((error) => ApiError.fromJson(error as Map<String, dynamic>))
          .toList(),
    );
  }
}
