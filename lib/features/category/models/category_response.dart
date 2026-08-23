import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saku_kita_app/features/household/models/household_response.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
abstract class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    required final String id,
    required final String name,
    String? type,
    String? icon,
    String? color,
    required bool isSystem,
    required HouseholdResponse? household,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
