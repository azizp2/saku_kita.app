import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/%20app.dart';

void main() {
  testWidgets('Saku.Kita login page', (tester) async {
    await tester.pumpWidget(const SakuKitaApp());

    expect(find.text('Selamat datang 👋'), findsOneWidget);

    expect(find.text('Masuk'), findsOneWidget);

    expect(find.text('Lupa kata sandi?'), findsOneWidget);

    expect(find.text('Belum punya akun?'), findsOneWidget);
  });
}
