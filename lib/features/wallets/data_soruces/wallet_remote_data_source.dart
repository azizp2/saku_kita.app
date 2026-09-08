import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/network/api_endpoints.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_request.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_response.dart';

class WalletRemoteDataSource {
  final ApiClient apiClient;

  WalletRemoteDataSource({required this.apiClient});

  Future<List<WalletResponse>?> getList() async {
    final response = await apiClient.getAndParse(
      ApiEndpoints.wallet,
      fromJson: (json) => (json as List)
          .map((e) => WalletResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response.data;
  }

  Future<bool> create(WalletRequest param) async {
    final response = await apiClient.post(
      ApiEndpoints.wallet,
      data: param.toJson(),
    );

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> update(String id, WalletRequest param) async {
    final response = await apiClient.patch(
      '${ApiEndpoints.wallet}/$id',
      data: param.toJson(),
    );

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> delete(String id) async {
    final response = await apiClient.delete('${ApiEndpoints.wallet}/$id');

    if (response.statusCode == 200) return true;

    return false;
  }

  Future<bool> setMainWallet(String id) async {
    final response = await apiClient.patch(
      '${ApiEndpoints.wallet}/$id/default',
    );

    if (response.statusCode == 200) return true;

    return false;
  }
}
