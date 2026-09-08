import 'package:get/get.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/features/wallets/data_soruces/wallet_remote_data_source.dart';
import 'package:saku_kita_app/features/wallets/repo/wallet_repo.dart';

import '../controllers/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletRemoteDataSource>(
      () => WalletRemoteDataSource(apiClient: Get.find<ApiClient>()),
    );

    Get.lazyPut<WalletRepo>(
      () => WalletRepo(remote: Get.find<WalletRemoteDataSource>()),
    );

    Get.lazyPut<WalletController>(
      () => WalletController(walletRepo: Get.find<WalletRepo>()),
    );
  }
}
