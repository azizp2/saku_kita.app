import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/network/api_endpoints.dart';
import 'package:saku_kita_app/features/category/models/category_request.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';

class CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSource({required this.apiClient});

  Future<List<CategoryResponse>?> getList() async {
    final response = await apiClient.getAndParse(
      ApiEndpoints.category,
      fromJson: (json) => (json as List)
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response.data;
  }

  Future<bool> create(CategoryRequest param) async {
    final response = await apiClient.post(
      ApiEndpoints.category,
      data: param.toJson(),
    );

    if (response.statusCode == 200) return true;

    return false;
  }
}
