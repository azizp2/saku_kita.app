import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_request.freezed.dart';
part 'wallet_request.g.dart';

@freezed
abstract class WalletRequest with _$WalletRequest {
  const factory WalletRequest({
    required final String name,
    @Default('Tabungan') String type,
    @Default(0.0) double initialBalance,
    @Default(false) bool isMainWallet,
    String? icon,
    String? color,
  }) = _WalletRequest;

  factory WalletRequest.fromJson(Map<String, dynamic> json) =>
      _$WalletRequestFromJson(json);
}
