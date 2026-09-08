import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_response.freezed.dart';
part 'wallet_response.g.dart';

@freezed
abstract class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    required final String id,
    required final String name,
    required final String type,
    required final bool isMainWallet,
    required final double balance,
    String? icon,
    String? color,
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletResponseFromJson(json);
}
