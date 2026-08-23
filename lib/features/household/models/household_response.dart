import 'package:freezed_annotation/freezed_annotation.dart';

part 'household_response.freezed.dart';
part 'household_response.g.dart';

@freezed
abstract class HouseholdResponse with _$HouseholdResponse {
  const factory HouseholdResponse({required String id, required String name}) =
      _HouseholdResponse;

  factory HouseholdResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseholdResponseFromJson(json);
}
