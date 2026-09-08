import 'package:saku_kita_app/features/wallets/data_soruces/wallet_remote_data_source.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_request.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_response.dart';

class WalletRepo {
  final WalletRemoteDataSource remote;

  WalletRepo({required this.remote});

  Future<List<WalletResponse>?> getList() => remote.getList();

  Future<bool> create(WalletRequest param) => remote.create(param);
  Future<bool> update(String id, WalletRequest param) =>
      remote.update(id, param);
  Future<bool> delete(String id) => remote.delete(id);
  Future<bool> setMainWallet(String id) => remote.setMainWallet(id);
}
