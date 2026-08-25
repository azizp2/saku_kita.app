import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_request.freezed.dart';
part 'category_request.g.dart';

@freezed
abstract class CategoryRequest with _$CategoryRequest {
  const factory CategoryRequest({
    required final String name,
    required final String type,
    String? icon,
    String? color,
    @Default(false) bool? isSystem,
  }) = _CategoryRequest;

  factory CategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CategoryRequestFromJson(json);
}
